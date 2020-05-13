# .NET Framework on Windows image

This Dockerfile builds a Windows image (the big one, not Windows Server Core) with .NET Framework 4.8.

The Dockerfile is based on https://github.com/microsoft/dotnet-framework-docker/blob/master/4.8/runtime/windowsservercore-ltsc2019/Dockerfile
with a few changes

```diff
3c3
< FROM mcr.microsoft.com/windows/servercore:ltsc2019
---
> FROM mcr.microsoft.com/windows:1809
4a5
> USER ContainerAdministrator
```

The main difference is that the big Windows image has the default user ContainerUser instead of ContainerAdministrator and therefore does not have enough permission to install software.

