#!/bin/bash

docker build -t node 4.5
docker tag node:latest node:4.5.0

docker build -t node:onbuild 4.5/onbuild

docker build -t node 6.4
docker tag node:latest node:6.4.0

docker build -t node:onbuild 6.4/onbuild
