# Node

A Windows Docker container with Node.js 4.2.1 installed.

## Building

```
docker build -t node .
docker tag node:latest node:4.2.1
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
