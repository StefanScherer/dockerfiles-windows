# Node

A Windows Server Core Docker container image with Node.js 6.10.2 installed.

## Building

```
docker build -t node .
docker tag node:latest node:6.10.2
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
