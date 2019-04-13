FROM mcr.microsoft.com/windows/servercore:ltsc2016
MAINTAINER scherer_stefan@icloud.com

ENV OPENSSL_VERSION 1.1.0.60000000
ENV chocolateyUseWindowsCompression false
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature disable --name showDownloadProgress ; \
    choco install -y openssl.light --version $env:OPENSSL_VERSION

WORKDIR "C:\\Program Files\\OpenSSL\\bin"

CMD .\openssl.exe genrsa -out /certs/$env:KEY_NAME.key 1024 ; \
    .\openssl.exe req  -new -newkey rsa:4096 -days 365 -nodes -subj $('/C=/ST=/L=/O=/CN={0}' -f $env:COMMON_NAME) -keyout /certs/$env:KEY_NAME.key -out /certs/$env:KEY_NAME.csr ; \
    .\openssl.exe x509 -req -days 365 -in /certs/$env:KEY_NAME.csr -signkey /certs/$env:KEY_NAME.key -out /certs/$env:KEY_NAME.crt
