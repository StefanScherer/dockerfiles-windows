#!/bin/bash
docker build -t openjdk:8-install -f windowsservercore/Dockerfile.install .
docker rm -f openjdk-8-install
docker create --name openjdk-8-install openjdk:8-install
rm -rf tmp
docker cp "openjdk-8-install:/Program Files/RedHat" tmp/
docker build -t openjdk:8-windowsservercore -f windowsservercore/Dockerfile .
docker build -t openjdk:8-nanoserver -f nanoserver/Dockerfile .
docker run openjdk:8-windowsservercore java -version
docker run openjdk:8-nanoserver java -version
