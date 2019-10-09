#!/bin/bash
osversion=${1:-1809}
echo $osversion
image=mcr.microsoft.com/windows/nanoserver:$osversion
docker pull $image
tag=$(docker image inspect $image | jq -r '.[0].OsVersion')
docker tag $image stefanscherer/nanoserver:$tag
echo "Pushing stefanscherer/nanoserver:$tag"
docker push stefanscherer/nanoserver:$tag
docker tag $image stefanscherer/nanoserver:$osversion
echo "Pushing stefanscherer/nanoserver:$osversion"
docker push stefanscherer/nanoserver:$osversion

