FROM microsoft/windowsservercore:10.0.14393.2068

ENV POSHSPEC_VERSION 2.2.1

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force ; \
    Install-Module -Name poshspec -Force -AllowClobber -RequiredVersion $env:POSHSPEC_VERSION
