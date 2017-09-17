#!/bin/bash

echo "Build testpipe.exe"
eval $(docker-machine env -unset)
docker run -it -v "$PWD":/go/src/myapp -w /go/src/myapp -e GOOS=windows golang bash -c 'go get -v ./... && go build testpipe.go'

echo "Build Docker image"
eval $(docker-machine env insider)
docker build -t stefanscherer/testpipe:insider .
