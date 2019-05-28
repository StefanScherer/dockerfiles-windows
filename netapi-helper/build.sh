#!/bin/bash

if [ "$1" == "" ]; then
  echo "Usage: $0 1803|1809|1903"
  exit 1
fi

docker pull mcr.microsoft.com/windows/servercore:$1
docker pull mcr.microsoft.com/windows/nanoserver:$1
docker build -t stefanscherer/netapi-helper:$1 --build-arg tag=$1 .
docker push stefanscherer/netapi-helper:$1
