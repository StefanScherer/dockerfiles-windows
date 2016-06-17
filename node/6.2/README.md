# Node

A Windows Server Core Docker container image with Node.js 6.2.1 installed.

**Notice: Node.js 6.x does not work in a Windows Docker container, see issue [nodejs/node#7044](https://github.com/nodejs/node/issues/7044)**.

## Building

```
docker build -t node .
docker tag node:latest node:6.2.1
```

## Onbuild

```
docker build -t node:onbuild onbuild
```
