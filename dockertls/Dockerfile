# escape=`
FROM mcr.microsoft.com/powershell:nanoserver-1809
SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV VERSION 2.5.5

ENV LIBRESSLPATH C:\libressl

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; `
  Invoke-WebRequest "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$Env:VERSION-windows.zip" -OutFile $Env:Temp\libressl.zip -UseBasicParsing ; `
  Expand-Archive $Env:Temp\libressl.zip -DestinationPath $Env:Temp ; `
  New-Item -ItemType Directory -Path $Env:LIBRESSLPATH ; `
  Copy-Item $Env:Temp\libressl-$Env:VERSION-windows\x64\* $Env:LIBRESSLPATH\. ; `
  Remove-Item $Env:LIBRESSLPATH\*.pdb ; `
  Remove-Item $Env:Temp\libressl-$Env:VERSION-windows, $Env:Temp\libressl.zip -Force -Recurse ; `
  New-Item -ItemType Directory -Path $Env:LIBRESSLPATH\ssl 

COPY openssl.cnf $LIBRESSLPATH/ssl/.
COPY generate-certs.ps1 generate-certs.ps1
CMD . .\generate-certs.ps1
