# OpenJDK for Windows

Build a Docker image with OpenJDK for Windows.
The Zulu OpenJDK from Azul Systems https://www.azul.com/downloads/zulu/zulu-windows/ is used for these images.

## Build the Windows images

```bash
docker build -t openjdk:8-windowsservercore -f windowsservercore/Dockerfile .
docker build -t openjdk:8-nanoserver -f nanoserver/Dockerfile .
```

## Test the images

```bash
docker run openjdk:8-windowsservercore java -version
docker run openjdk:8-nanoserver java -version
```
