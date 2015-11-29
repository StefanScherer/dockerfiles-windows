#!/bin/bash
docker build -t java .
docker tag -f java:latest java:8.0.66
