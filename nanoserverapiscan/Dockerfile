# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN (New-Object System.Net.WebClient).DownloadFile('https://msdnshared.blob.core.windows.net/media/2016/04/NanoServerApiScan.zip', 'NanoServerApiScan.zip') ; `
    Expand-Archive NanoServerApiScan.zip -DestinationPath C:\tool ; `
    Remove-Item NanoServerApiScan.zip

COPY tmp/Forwarders /tool

COPY tmp/kit /kit/10/Lib/10.0.14393.0

RUN mkdir C:\scan
WORKDIR /scan

CMD ["C:\\tool\\NanoServerApiScan.exe", "/BinaryPath:C:\\scan", "/WindowsKitsPath:C:\\kit"]
