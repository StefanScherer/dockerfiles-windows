# Node

A Windows Server Core Docker container image with Node.js 6.11.4 installed.

## Building

```
docker build -t node .
docker tag node:latest node:6.11.4
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
