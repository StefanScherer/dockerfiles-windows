#!/bin/bash
docker build -t openjdk:8-windowsservercore -f windowsservercore/Dockerfile .
docker build -t openjdk:8-nanoserver -f nanoserver/Dockerfile .
docker run openjdk:8-windowsservercore java -version
docker run openjdk:8-nanoserver java -version
