# Node

A Windows Server Core Docker container image with Node.js 10.16.3 installed.

## Images

- stefanscherer/node-windows:10.16.3 -> Nano Server + Node + NPM + Yarn + Git
- stefanscherer/node-windows:10.16.3-pure -> Nano Server + Node
- stefanscherer/node-windows:10.16.3-windowsservercore -> Windows Server Core + Node + NPM + Yarn + Git
- stefanscherer/node-windows:10.16.3-build-tools -> + Python + C++ build tools

## Building

To build the images yourself use the following commands:

```
docker build -t node:10.16.3-windowsservercore .
docker build -t node:10.16.3-nanoserver nano
docker build -t node:10.16.3-pure pure
```

### Build with 1803 or newer base images

On Windows Server 1803 or any current Windows 10 machine you might want to use the smaller base images.

The `Dockerfile` is prepared to run on any Windows platform, but you have to specify some build arguments to make it work with newer base images.

```
docker build -t node:10.16.3-windowsservercore `
  --build-arg core=mcr.microsoft.com/windows/servercore:1803 `
  --build-arg target=mcr.microsoft.com/windows/nanoserver:1803 .
docker build -t node:10.16.3-nanoserver `
  --build-arg core=mcr.microsoft.com/windows/servercore:1803 `
  --build-arg target=mcr.microsoft.com/windows/nanoserver:1803 `
  --build-arg "SETX= " nano
docker build -t node:10.16.3-pure `
  --build-arg core=mcr.microsoft.com/windows/servercore:1803 `
  --build-arg target=mcr.microsoft.com/windows/nanoserver:1803 pure
```

Watch out for the SETX parameter to have a blank value to overwrite the `/M` default needed for 2016.

