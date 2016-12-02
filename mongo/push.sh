#!/bin/bash
docker tag mongo:3.4.0 stefanscherer/mongo-windows:3.4.0
docker tag mongo:3.4.0 stefanscherer/mongo-windows:latest

docker tag mongo:3.4.0-nano stefanscherer/mongo-windows:3.4.0-nano
docker tag mongo:3.4.0-nano stefanscherer/mongo-windows:nano

docker push stefanscherer/mongo-windows:3.4.0
docker push stefanscherer/mongo-windows:latest

docker push stefanscherer/mongo-windows:3.4.0-nano
docker push stefanscherer/mongo-windows:nano
