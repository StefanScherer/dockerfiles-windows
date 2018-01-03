# Node

A Windows Server Core Docker container image with Node.js 8.9.4 installed.

## Images

- stefanscherer/node-windows:8.9.4 -> Windows Server Core + Node + NPM + Yarn
- stefanscherer/node-windows:8.9.4-build-tools -> + Python + C++ build tools
- stefanscherer/node-windows:8.9.4-nano -> Nano Server + Node + NPM + Yarn

## Building

```
docker build -t node .
docker tag node:latest node:8.9.4
```
