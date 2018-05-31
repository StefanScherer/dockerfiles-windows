# Node

A Windows Server Core Docker container image with Node.js 10.3.0 installed.

## Images

- stefanscherer/node-windows:10.3.0 -> Nano Server + Node + NPM + Yarn + Git
- stefanscherer/node-windows:10.3.0-pure -> Nano Server + Node
- stefanscherer/node-windows:10.3.0-windowsservercore -> Windows Server Core + Node + NPM + Yarn + Git
- stefanscherer/node-windows:10.3.0-build-tools -> + Python + C++ build tools

## Building

```
docker build -t node .
docker tag node:latest node:10.3.0
```
