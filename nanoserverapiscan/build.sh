#!/bin/bash

docker rm -f nano
docker create --name nano microsoft/nanoserver
rm -rf tmp
mkdir tmp
docker cp nano:Windows/System32/Forwarders tmp
docker build -t win10sdk -f Dockerfile.build .
docker rm -f win10sdk
docker create --name win10sdk win10sdk
mkdir -p tmp/kit/um/x64 tmp/kit/ucrt/x64
docker cp "win10sdk:Program Files (x86)/Windows Kits/10/Lib/10.0.14393.0/um/x64" tmp/kit/um/x64
docker cp "win10sdk:Program Files (x86)/Windows Kits/10/Lib/10.0.14393.0/ucrt/x64" tmp/kit/ucrt/x64

docker build -t nanoserverapiscan .
docker build -t nanoserverapiscan:onbuild onbuild
