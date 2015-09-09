# Node

A Windows Docker container with Node.js 4.0.0 installed.

## Building

```
docker build -t node .
docker tag node:latest node:4.0.0
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
