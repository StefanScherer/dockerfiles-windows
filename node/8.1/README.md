# Node

A Windows Server Core Docker container image with Node.js 8.1.4 installed.

## Building

```
docker build -t node .
docker tag node:latest node:8.1.4
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
