#!/bin/bash
image=mcr.microsoft.com/windows/nanoserver:1809
docker pull $image
tag=$(docker manifest inspect -v $image | jq -r '.[0].Descriptor.platform["os.version"]')
docker tag $image stefanscherer/nanoserver:$tag
echo "Pushing stefanscherer/nanoserver:$tag"
docker push stefanscherer/nanoserver:$tag
