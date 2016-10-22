#!/bin/bash
set -e

docker build -t node:4.6.1 4.6
docker tag node:4.6.1 node:latest
docker tag node:4.6.1 node:4.6
docker tag node:4.6.1 node:4

docker build -t node:4.6.1-onbuild 4.6/onbuild
docker tag node:4.6.1-onbuild node:4.6-onbuild
docker tag node:4.6.1-onbuild node:4-onbuild

docker build -t node:4.6.1-nano 4.6/nano
docker tag node:4.6.1-nano node:latest-nano
docker tag node:4.6.1-nano node:4.6-nano
docker tag node:4.6.1-nano node:4-nano

docker build -t node:4.6.1-nano-onbuild 4.6/nano/onbuild
docker tag node:4.6.1-nano-onbuild node:4.6-nano-onbuild
docker tag node:4.6.1-nano-onbuild node:4-nano-onbuild

docker build -t node:6.9.1 6.9
docker tag node:6.9.1 node:latest
docker tag node:6.9.1 node:6.9
docker tag node:6.9.1 node:6

docker build -t node:6.9.1-onbuild 6.9/onbuild
docker tag node:6.9.1-onbuild node:6.9-onbuild
docker tag node:6.9.1-onbuild node:6-onbuild

docker build -t node:6.9.1-nano 6.9/nano
docker tag node:6.9.1-nano node:latest-nano
docker tag node:6.9.1-nano node:6.9-nano
docker tag node:6.9.1-nano node:6-nano

docker build -t node:6.9.1-nano-onbuild 6.9/nano/onbuild
docker tag node:6.9.1-nano-onbuild node:6.9-nano-onbuild
docker tag node:6.9.1-nano-onbuild node:6-nano-onbuild
