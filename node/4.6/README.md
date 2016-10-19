# Node

A Windows Server Core Docker container image with Node.js 4.6.1 installed.

## Building

```
docker build -t node .
docker tag node:latest node:4.6.1
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
