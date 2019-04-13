# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2016 as download

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV APACHE_VERSION 2.4.29

RUN Invoke-WebRequest ('http://de.apachehaus.com/downloads/httpd-{0}-o102n-x64-vc14-r2.zip' -f $env:APACHE_VERSION) -OutFile 'apache.zip' -UseBasicParsing ; `
    Expand-Archive apache.zip -DestinationPath C:\ ; `
    Remove-Item -Path apache.zip

RUN Invoke-WebRequest 'https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe' -OutFile 'vc_redist.x64.exe'; `
    Start-Process '.\vc_redist.x64.exe' '/install /passive /norestart' -Wait; `
    Remove-Item vc_redist.x64.exe;

FROM mcr.microsoft.com/windows/servercore:ltsc2016

COPY --from=download C:\Apache24 C:\Apache24
COPY --from=download C:\windows\system32\msvcp140.dll C:\windows\system32
COPY --from=download C:\windows\system32\vcruntime140.dll C:\windows\system32

EXPOSE 80

CMD [ "C:\\Apache24\\bin\\httpd.exe" ]