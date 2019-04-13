FROM mcr.microsoft.com/windows/servercore:ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV JAVA_VERSION 8.19.0.1-jdk8.0.112
ENV JAVA_MD5 70bbe971a9a6995a9e909b709ae52b34

ENV JAVA_HOME C:\\zulu${JAVA_VERSION}-win_x64

RUN (New-Object System.Net.WebClient).DownloadFile('https://cdn.azul.com/zulu/bin/zulu{0}-win_x64.zip' -f $env:JAVA_VERSION, 'openjdk.zip') ; \
    if ((Get-FileHash openjdk.zip -Algorithm md5).Hash -ne $env:JAVA_MD5) {exit 1} ; \
    Expand-Archive openjdk.zip -DestinationPath C:\ ; \
    $env:PATH = '{0}\bin;{1}' -f $env:JAVA_HOME, $env:PATH ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine) ; \
    Remove-Item -Path openjdk.zip
