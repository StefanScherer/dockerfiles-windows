#!/bin/bash

docker build -t node 4.4
docker tag node:latest node:4.4.3

docker build -t node:onbuild 4.4/onbuild

docker build -t node 5.11
docker tag node:latest node:5.11.0

docker build -t node:onbuild 5.11/onbuild
