#!/bin/bash

if [ ! -e registry.exe ]; then
  docker build -t registry-builder build
  docker rm -f registry-builder
  docker create --name registry-builder registry-builder
  docker cp registry-builder:/gopath/src/github.com/docker/distribution/registry.exe ./registry.exe
fi
docker build --no-cache -t registry .
docker tag registry:latest registry:2.6.0-rc.1
