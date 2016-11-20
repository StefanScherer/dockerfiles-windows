# msbuild

Build a Docker image with Visual C++ Build tools.
The `entrypoint.bat` script calls the `vcbuildtools.bat` script to set all
environment variables.

## Build image

```
docker build -t msbuild .
```

## Use the image

```
docker run -v "$(pwd):C:\code" msbuild msbuild yourproject.sln /p:Configuration=Release
```
