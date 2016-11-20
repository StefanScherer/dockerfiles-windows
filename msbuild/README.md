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

## Example

```
git clone https://github.com/StefanScherer/win-getaddrinfo
cd win-getaddrinfo
docker run -v "$(pwd):C:\code" microsoft/msbuild msbuild getaddrinfo.sln /p:Configuration=Release
dir getaddrinfo.exe
```
