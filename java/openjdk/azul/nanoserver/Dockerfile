FROM mcr.microsoft.com/windows/nanoserver:10.0.14393.2068

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV JAVA_VERSION 8.19.0.1-jdk8.0.112
ENV JAVA_MD5 70bbe971a9a6995a9e909b709ae52b34

ENV JAVA_HOME C:\\zulu${JAVA_VERSION}-win_x64

RUN Invoke-WebRequest $('https://cdn.azul.com/zulu/bin/zulu{0}-win_x64.zip' -f $env:JAVA_VERSION) -OutFile 'openjdk.zip' -UseBasicParsing ; \
    if ((Get-FileHash openjdk.zip -Algorithm md5).Hash -ne $env:JAVA_MD5) {exit 1} ; \
    [System.IO.Compression.ZipFile]::ExtractToDirectory('C:\openjdk.zip', 'C:\') ; \
    $env:PATH = '{0}\bin;{1}' -f $env:JAVA_HOME, $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; \
    Remove-Item -Path openjdk.zip
