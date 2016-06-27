# Node - nanoserver

A Windows Nano Server Docker image with Node.js 4.4.6 installed.

## Building

First build the Windows Server Core Docker image.

```
docker run --name=node node:4.4.6 node --version
docker cp "node:c:\Program Files\nodejs" nodejs
docker rm -vf node

docker build --isolation=hyperv -t node:nano .

docker build -t node .
docker tag node:nano node:4.4.6-nano
```

## Onbuild

```
docker build --isolation=hyperv -t node:nano-onbuild onbuild
docker tag node:nano-onbuild node:4.4.6-nano-onbuild
```
