FROM mcr.microsoft.com/windows/servercore:ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV chocolateyUseWindowsCompression false

RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature disable --name showDownloadProgress

RUN choco install -y nodejs -version 7.3.0
RUN choco install -y git -params "/GitAndUnixToolsOnPath"
RUN npm install --global --production windows-build-tools

RUN git clone https://github.com/libuv/libuv.git
RUN cd libuv ; git pull ; \
    $env:PATH += ';C:\Users\ContainerAdministrator\.windows-build-tools\python27' ; \
    .\vcbuild.bat test
