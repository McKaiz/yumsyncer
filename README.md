# yumsyncer

[![Build Status](https://travis-ci.com/McKaiz/yumsyncer.svg?branch=main)](https://travis-ci.com/McKaiz/yumsyncer)

This container creates a local repositoty (without webserver for now) for the given .repo files in the repository, creates the repo with groups if given and waits for a rerun.

## Directories

`/data` => Destination for the synced repostory. Needs read/write access
`/repo` => Source for the .repo files. Can be read-only

## Environment Vars

`waitDuration` => Time after sync how long to wait. Default: 12h
`TZ` => Time Zone for the Container. Default: Europe/Amsterdam.

## Example

`docker run -d -v data:/data -v repo:/repo acrossthisnewdivide/yumsyncer`

This container has no default `.repo` files.
Make sure to take a look at this Readme before updating. This project is still under development so every update might break an existing container.

WITHOUT ANY WARRANTY!
