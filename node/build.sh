#!/bin/bash

docker build -t node 4.4
docker tag node:latest node:4.4.1

docker build -t node:onbuild 4.4/onbuild
