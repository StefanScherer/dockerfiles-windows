# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2019
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV VERSION 2.5.5

ENV LIBRESSLPATH C:\libressl

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; `
  Invoke-WebRequest "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$Env:VERSION-windows.zip" -OutFile libressl.zip -UseBasicParsing ; `
  Expand-Archive libressl.zip -DestinationPath $Env:Temp ; `
  New-Item -ItemType Directory -Path $Env:LIBRESSLPATH ; `
  Copy-Item $Env:Temp\libressl-$Env:VERSION-windows\x64\* $Env:LIBRESSLPATH\. ; `
  Remove-Item $Env:LIBRESSLPATH\*.pdb ; `
  $newPath = ('{0};{1}' -f $Env:LIBRESSLPATH, $Env:PATH); `
  Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $newPath ; `
  Remove-Item $Env:Temp\libressl-$Env:VERSION-windows, libressl.zip -Force -Recurse ; `
  New-Item -ItemType Directory -Path $Env:LIBRESSLPATH\ssl

COPY openssl.cnf $LIBRESSLPATH/ssl/.
COPY generate-certs.ps1 generate-certs.ps1
CMD . .\generate-certs.ps1
