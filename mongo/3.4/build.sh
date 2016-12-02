#!/bin/bash
docker build -t mongobuilder -f Dockerfile.build .
docker rm -f mongobuilder
docker create --name=mongobuilder mongobuilder
rm -rf build
mkdir build

docker cp mongobuilder:/mongodb build
docker cp mongobuilder:/windows/system32/msvcp140.dll build/mongodb/bin
docker cp mongobuilder:/windows/system32/vcruntime140.dll build/mongodb/bin
rm -f build/mongodb/bin/*.pdb

docker build -t mongo .
docker tag mongo:latest mongo:3.4.0

docker build -t mongo:nano -f nano/Dockerfile .
docker tag mongo:nano mongo:3.4.0-nano

# check images
echo "Check windowsservercore"
docker run mongo mongod.exe -version
echo "Check nanoserver"
docker run mongo:nano mongod.exe -version
