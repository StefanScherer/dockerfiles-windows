# Node

A Windows Server Core Docker container image with Node.js 8.9.3 installed.

## Images

- stefanscherer/node-windows:8.9.3 -> Windows Server Core + Node + NPM + Yarn
- stefanscherer/node-windows:8.9.3-build-tools -> + Python + C++ build tools
- stefanscherer/node-windows:8.9.3-nano -> Nano Server + Node + NPM + Yarn

## Building

```
docker build -t node .
docker tag node:latest node:8.9.3
```
