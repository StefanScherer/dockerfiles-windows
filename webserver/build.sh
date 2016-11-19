#!/bin/bash
docker build -t webserverbuild -f Dockerfile.build .
docker rm -f webserverbuild
docker create --name webserverbuild webserverbuild
rm -rf tmp
mkdir tmp
docker cp webserverbuild:/code/webserver.exe tmp
docker build -t webserver .
