# Node

A Windows Server Core Docker container image with Node.js 10.1.0 installed.

## Images

- stefanscherer/node-windows:10.1.0 -> Windows Server Core + Node + NPM + Yarn
- stefanscherer/node-windows:10.1.0-build-tools -> + Python + C++ build tools
- stefanscherer/node-windows:10.1.0-nano -> Nano Server + Node + NPM + Yarn

## Building

```
docker build -t node .
docker tag node:latest node:10.1.0
```
