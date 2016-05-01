#!/bin/bash

docker build -t node 4.4
docker tag node:latest node:4.4.3

docker build -t node:onbuild 4.4/onbuild

docker build -t node 6.0
docker tag node:latest node:6.0.0

docker build -t node:onbuild 6.0/onbuild
