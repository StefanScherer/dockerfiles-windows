# Node

A Windows Server Core Docker container image with Node.js 8.1.3 installed.

## Building

```
docker build -t node .
docker tag node:latest node:8.1.3
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
