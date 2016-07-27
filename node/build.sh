#!/bin/bash

docker build -t node 4.4
docker tag node:latest node:4.4.7

docker build -t node:onbuild 4.4/onbuild

docker build -t node 6.3
docker tag node:latest node:6.3.1

docker build -t node:onbuild 6.3/onbuild
