# Node

A Windows Server Core Docker container image with Node.js 4.4.5 installed.

## Building

```
docker build -t node .
docker tag node:latest node:4.4.5
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
