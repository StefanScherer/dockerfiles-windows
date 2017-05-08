#!/bin/bash
docker run -v C:$(pwd):C:/code msbuild msbuild realpath.sln /p:Configuration=Release /p:Platform=x64
docker build -t realpath .
