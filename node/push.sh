#!/bin/bash
set -e
docker tag node:4.6.1 stefanscherer/node-windows:4.6.1
docker tag node:4.6 stefanscherer/node-windows:4.6
docker tag node:4 stefanscherer/node-windows:4

docker tag node:4.6.1-onbuild stefanscherer/node-windows:4.6.1-onbuild
docker tag node:4.6-onbuild stefanscherer/node-windows:4.6-onbuild
docker tag node:4-onbuild stefanscherer/node-windows:4-onbuild

docker tag node:4.6.1-nano stefanscherer/node-windows:4.6.1-nano
docker tag node:4.6-nano stefanscherer/node-windows:4.6-nano
docker tag node:4-nano stefanscherer/node-windows:4-nano

docker tag node:4.6.1-nano-onbuild stefanscherer/node-windows:4.6.1-nano-onbuild
docker tag node:4.6-nano-onbuild stefanscherer/node-windows:4.6-nano-onbuild
docker tag node:4-nano-onbuild stefanscherer/node-windows:4-nano-onbuild

docker tag node:6.9.1 stefanscherer/node-windows:6.9.1
docker tag node:6.9 stefanscherer/node-windows:6.9
docker tag node:6 stefanscherer/node-windows:6

docker tag node:6.9.1-onbuild stefanscherer/node-windows:6.9.1-onbuild
docker tag node:6.9-onbuild stefanscherer/node-windows:6.9-onbuild
docker tag node:6-onbuild stefanscherer/node-windows:6-onbuild

docker tag node:6 stefanscherer/node-windows:latest
docker tag node:6-onbuild stefanscherer/node-windows:onbuild

docker tag node:6.9.1-nano stefanscherer/node-windows:6.9.1-nano
docker tag node:6.9-nano stefanscherer/node-windows:6.9-nano
docker tag node:6-nano stefanscherer/node-windows:6-nano

docker tag node:6.9.1-nano-onbuild stefanscherer/node-windows:6.9.1-nano-onbuild
docker tag node:6.9-nano-onbuild stefanscherer/node-windows:6.9-nano-onbuild
docker tag node:6-nano-onbuild stefanscherer/node-windows:6-nano-onbuild

docker push stefanscherer/node-windows:4.6.1
docker push stefanscherer/node-windows:4.6
docker push stefanscherer/node-windows:4
docker push stefanscherer/node-windows:4.6.1-onbuild
docker push stefanscherer/node-windows:4.6-onbuild
docker push stefanscherer/node-windows:4-onbuild
docker push stefanscherer/node-windows:4.6.1-nano
docker push stefanscherer/node-windows:4.6-nano
docker push stefanscherer/node-windows:4-nano
docker push stefanscherer/node-windows:4.6.1-nano-onbuild
docker push stefanscherer/node-windows:4.6-nano-onbuild
docker push stefanscherer/node-windows:4-nano-onbuild

docker push stefanscherer/node-windows:6.9.1
docker push stefanscherer/node-windows:6.9
docker push stefanscherer/node-windows:6
docker push stefanscherer/node-windows:6.9.1-onbuild
docker push stefanscherer/node-windows:6.9-onbuild
docker push stefanscherer/node-windows:6-onbuild
docker push stefanscherer/node-windows:onbuild
docker push stefanscherer/node-windows:latest
docker push stefanscherer/node-windows:6.9.1-nano
docker push stefanscherer/node-windows:6.9-nano
docker push stefanscherer/node-windows:6-nano
docker push stefanscherer/node-windows:6.9.1-nano-onbuild
docker push stefanscherer/node-windows:6.9-nano-onbuild
docker push stefanscherer/node-windows:6-nano-onbuild
