# Node

A Windows Server Core Docker container image with Node.js 8.11.2 installed.

## Images

- stefanscherer/node-windows:8.11.2 -> Nano Server + Node + NPM + Yarn + Git
- stefanscherer/node-windows:8.11.2-pure -> Nano Server + Node
- stefanscherer/node-windows:8.11.2-windowsservercore -> Windows Server Core + Node + NPM + Yarn + Git
- stefanscherer/node-windows:8.11.2-build-tools -> + Python + C++ build tools

## Building

```
docker build -t node .
docker tag node:latest node:8.11.2
```
