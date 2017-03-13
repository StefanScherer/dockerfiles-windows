FROM golang:1.8-nanoserver

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV GIT_VERSION 2.12.0
ENV GIT_DOWNLOAD_URL https://github.com/git-for-windows/git/releases/download/v${GIT_VERSION}.windows.1/MinGit-${GIT_VERSION}-64-bit.zip
ENV GIT_SHA256 6238f65c4d8412b993cb092efde4954f8cb7da4def54d0c1533835f00e83fdad

RUN Invoke-WebRequest -UseBasicParsing $env:GIT_DOWNLOAD_URL -OutFile git.zip; \
    if ((Get-FileHash git.zip -Algorithm sha256).Hash -ne $env:GIT_SHA256) {exit 1} ; \
    Expand-Archive git.zip -DestinationPath C:\git; \
    Remove-Item git.zip; \
    Write-Host 'Updating PATH ...'; \
    $env:PATH = 'C:\git\cmd;C:\git\mingw64\bin;C:\git\usr\bin;' + $env:PATH; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH
