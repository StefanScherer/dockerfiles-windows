# Node

A Windows Server Core Docker container image with Node.js 8.8.1 installed.

## Images

- stefanscherer/node-windows:8.8.1 -> Windows Server Core + Node + NPM + Yarn
- stefanscherer/node-windows:8.8.1-build-tools -> + Python + C++ build tools
- stefanscherer/node-windows:8.8.1-nano -> Nano Server + Node + NPM + Yarn

## Building

```
docker build -t node .
docker tag node:latest node:8.8.1
```
