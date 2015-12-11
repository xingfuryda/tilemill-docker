# Tilemill Container

This repository contains instructions for building a
[Docker](https://www.docker.io/) image containing software
for editing map styles in Tilemill

Tilemill allows you to:

* Use existing projects as a starting point
* Define styling rules which define layer colours and visibility
* Export maps in image format or as a package of tiles in mbtiles format

Run `docker run xingfuryda/tilemill-docker` for usage instructions.

## About

The container runs Ubuntu 14.04 (Trusty) and is based on the
[phusion/baseimage-docker](https://github.com/phusion/baseimage-docker).  It
includes:

* Nodejs legacy
* The latest [Tilemill](https://github.com/mapbox/tilemill) code (at
  the time of image creation 0.10.1 ++ December 2015)

## Issues

This is a work in progress and although generally adequate it could benefit
from improvements.  Please
[submit issues](https://github.com/xingfuryda/tilemill-docker/issues)
on GitHub. Pull requests are very welcome!
