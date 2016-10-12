#!/bin/bash
set -e

docker build -t node:4.6.0 4.6
docker tag node:4.6.0 node:latest
docker tag node:4.6.0 node:4.6
docker tag node:4.6.0 node:4

docker build -t node:4.6.0-onbuild 4.6/onbuild
docker tag node:4.6.0-onbuild node:4.6-onbuild
docker tag node:4.6.0-onbuild node:4-onbuild

docker build -t node:4.6.0-nano 4.6/nano
docker tag node:4.6.0-nano node:latest-nano
docker tag node:4.6.0-nano node:4.6-nano
docker tag node:4.6.0-nano node:4-nano

docker build -t node:4.6.0-nano-onbuild 4.6/nano/onbuild
docker tag node:4.6.0-nano-onbuild node:4.6-nano-onbuild
docker tag node:4.6.0-nano-onbuild node:4-nano-onbuild

docker build -t node:6.8.0 6.8
docker tag node:6.8.0 node:latest
docker tag node:6.8.0 node:6.8
docker tag node:6.8.0 node:6

docker build -t node:6.8.0-onbuild 6.8/onbuild
docker tag node:6.8.0-onbuild node:6.8-onbuild
docker tag node:6.8.0-onbuild node:6-onbuild

docker build -t node:6.8.0-nano 6.8/nano
docker tag node:6.8.0-nano node:latest-nano
docker tag node:6.8.0-nano node:6.8-nano
docker tag node:6.8.0-nano node:6-nano

docker build -t node:6.8.0-nano-onbuild 6.8/nano/onbuild
docker tag node:6.8.0-nano-onbuild node:6.8-nano-onbuild
docker tag node:6.8.0-nano-onbuild node:6-nano-onbuild
