#!/bin/bash

docker build -t node 4.4
docker tag node:latest node:4.4.4

docker build -t node:onbuild 4.4/onbuild

docker build -t node 6.1
docker tag node:latest node:6.1.0

docker build -t node:onbuild 6.1/onbuild
