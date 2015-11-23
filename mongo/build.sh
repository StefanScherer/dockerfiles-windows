#!/bin/bash
docker build -t mongo 3.0
docker tag mongo:latest mongo:3.0.7
