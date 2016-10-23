FROM microsoft/windowsservercore
MAINTAINER scherer_stefan@icloud.com

ENV chocolateyUseWindowsCompression false
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install -y openssl.light; \
    $env:PATH = 'C:\Program Files\OpenSSL\bin;' + $env:PATH; \
  	[Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

COPY generate-certs.ps1 generate-certs.ps1

CMD . .\generate-certs.ps1
