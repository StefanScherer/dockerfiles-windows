#!/bin/bash
docker build -t java .
docker tag java:latest java:8.0.91
