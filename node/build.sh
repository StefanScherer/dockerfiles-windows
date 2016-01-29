#!/bin/bash

docker build -t node 4.2
docker tag node:latest node:4.2.1

docker build -t node:onbuild 4.2/onbuild
