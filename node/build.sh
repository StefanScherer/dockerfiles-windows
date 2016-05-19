#!/bin/bash

docker build -t node 4.4
docker tag node:latest node:4.4.4

docker build -t node:onbuild 4.4/onbuild

docker build -t node 6.2
docker tag node:latest node:6.2.0

docker build -t node:onbuild 6.2/onbuild
