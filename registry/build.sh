#!/bin/bash

if [ ! -e registry.exe ]; then
  docker build -t registry-builder build
  docker rm -f registry-builder
  docker run --name registry-builder registry-builder registry --version
  docker cp registry-builder:/go/src/github.com/docker/distribution/registry.exe ./registry.exe
fi
docker build -t registry .
docker tag registry:latest registry:2.5.1
