# Node

A Windows Server Core Docker container image with Node.js 6.11.1 installed.

## Building

```
docker build -t node .
docker tag node:latest node:6.11.1
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
