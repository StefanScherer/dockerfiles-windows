#!/bin/bash
set -e

if [ ! -d docker  ]; then 
  git clone https://github.com/docker/docker
fi

if [ ! -d binary  ]; then
  mkdir binary
fi

BINDIR=$(pwd)
image=docker
pushd docker
if [ $1 != ""  ]; then
  git fetch origin pull/$1/head:pr$1
  git checkout pr$1
  image=dockerpr$1
fi
docker rm -f $image || true
DOCKER_GITCOMMIT=(git rev-parse --short HEAD)
docker build -t $image -f Dockerfile.windows .
docker run -e DOCKER_GITCOMMIT=$DOCKER_GITCOMMIT --name $image $image 'hack\make.ps1' -Binary
docker cp $image:C:/go/src/github.com/docker/docker/bundles/docker.exe ../binary/docker.exe
docker cp $image:C:/go/src/github.com/docker/docker/bundles/dockerd.exe ../binary/dockerd.exe
popd
ls -l binary
