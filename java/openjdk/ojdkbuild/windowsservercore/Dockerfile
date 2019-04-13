FROM mcr.microsoft.com/windows/servercore:ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV JAVA_VERSION 1.8.0.111-3
ENV JAVA_ZIP_VERSION 1.8.0-openjdk-1.8.0.111-3.b15
ENV JAVA_SHA256 e080371bf57536668416157660e05d95fe04db15da36234d32bda8e301bb0454

ENV JAVA_HOME C:\\java-${JAVA_ZIP_VERSION}.ojdkbuild.windows.x86_64

RUN (New-Object System.Net.WebClient).DownloadFile(('https://github.com/ojdkbuild/ojdkbuild/releases/download/{0}/java-{1}.ojdkbuild.windows.x86_64.zip' -f $env:JAVA_VERSION, $env:JAVA_ZIP_VERSION), 'openjdk.zip') ; \
    if ((Get-FileHash openjdk.zip -Algorithm sha256).Hash -ne $env:JAVA_SHA256) {exit 1} ; \
    Expand-Archive openjdk.zip -DestinationPath C:\ ; \
    $env:PATH = '{0}\bin;{1}' -f $env:JAVA_HOME, $env:PATH ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine) ; \
    Remove-Item -Path openjdk.zip
