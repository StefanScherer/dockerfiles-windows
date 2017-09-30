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

## See also

- [Installing Build Tools for Visual Studio 2017 in a Docker container](https://blogs.msdn.microsoft.com/heaths/2017/09/18/installing-build-tools-for-visual-studio-2017-in-a-docker-container/?utm_source=t.co&utm_medium=referral) by Heath Stewart
  - [Dockerfile](https://gist.github.com/heaths/a81048f5eb6f1476e49ca2783d31a836#file-dockerfile)
