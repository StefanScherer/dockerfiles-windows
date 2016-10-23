FROM microsoft/windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ENV VERSION 2.5.0

ENV LIBRESSLPATH C:\\libressl

# Remark: openbsd's SSL seems to be wonky (ironically)
RUN [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12' ; \
	Invoke-WebRequest "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$Env:VERSION-windows.zip" -OutFile libressl.zip -UseBasicParsing ; \
	Expand-Archive libressl.zip -DestinationPath $Env:Temp ; \
	New-Item -ItemType Directory -Path $Env:LIBRESSLPATH ; \
	Copy-Item $Env:Temp\libressl-$Env:VERSION-windows\x64\* $Env:LIBRESSLPATH\. ; \
	$newPath = ('{0};{1}' -f $Env:LIBRESSLPATH, $Env:PATH); \
	setx /M PATH $newPath; \
	Remove-Item $Env:Temp\libressl-$Env:VERSION-windows, libressl.zip -Force -Recurse ; \
	New-Item -ItemType Directory -Path $Env:LIBRESSLPATH\ssl

COPY openssl.cnf $LIBRESSLPATH/ssl/.
COPY generate-certs.ps1 generate-certs.ps1
CMD . .\generate-certs.ps1
