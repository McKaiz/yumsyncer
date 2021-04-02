#!/bin/bash

##################################################################################
#MIT License
#
#Copyright (c) 2021 Kai
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
##################################################################################

DIR=/data/centos/
while true; do
    start=$(date +"%T")
    echo "Starting sync @"$start
    rm -f /etc/yum.repos.d/*
    cp /repo/*.repo /etc/yum.repos.d/.
    reposync -g -l -d -m --newest-only --download-metadata --download_path=${DIR}

    for directory in $DIR/*/; do
        if test -f $directory/comps.xml; then
            cd $directory && createrepo -g comps.xml .
        else
            cd $directory && createrepo .
        fi
    done
    end=$(date +"%T")

    echo "Done Downloading! Waiting for" ${waitDuration} "(Current Time: " $end ")"
    sleep ${waitDuration}
done
