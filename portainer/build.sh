#!/bin/bash
curl -o portainer.tar.gz https://github.com/portainer/portainer/releases/download/1.14.0/portainer-1.14.0-windows-amd64.tar.gz
tar xzf portainer.tar.gz
rm portainer.tar.gz
# eval $(docker-machine insider)
docker build -t portainer .
