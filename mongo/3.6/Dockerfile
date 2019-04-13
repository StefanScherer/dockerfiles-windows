# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2016 as download

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV MONGO_VERSION 3.6.5
ENV MONGO_DOWNLOAD_URL http://downloads.mongodb.org/win32/mongodb-win32-x86_64-2008plus-ssl-${MONGO_VERSION}.zip
ENV MONGO_DOWNLOAD_SHA256 3546f8d5721e91c9158133d37335d35703207af566266b248eeba6ed0db0fbc0

RUN Write-Host ('Downloading {0} ...' -f $env:MONGO_DOWNLOAD_URL)
RUN Invoke-WebRequest -Uri $env:MONGO_DOWNLOAD_URL -OutFile 'mongodb.zip'
RUN Write-Host ('Verifying sha256 ({0}) ...' -f $env:MONGO_DOWNLOAD_SHA256)
RUN if ((Get-FileHash mongodb.zip -Algorithm sha256).Hash -ne $env:MONGO_DOWNLOAD_SHA256) { `
      Write-Host 'FAILED!'; `
      exit 1; `
    }

RUN Write-Host ('Downloading Visual C++ Redistributable Package')
RUN Invoke-WebRequest -Uri https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe -OutFile vcredist.exe
RUN Expand-Archive mongodb.zip -DestinationPath C:
RUN Start-Process .\vcredist.exe -ArgumentList '/install', '/quiet', '/norestart' -NoNewWindow -Wait

RUN Write-Host ('Preparing one folder for final COPY deployment into NanoServer')
RUN mkdir C:\prepare ; `
    cp C:\windows\system32\msvcp140.dll C:\prepare ; `
    cp C:\windows\system32\vccorlib140.dll C:\prepare ; `
    cp C:\windows\system32\vcruntime140.dll C:\prepare ; `
    cp C:\mongodb-win32-x86_64-2008plus-ssl-$env:MONGO_VERSION\bin\*.exe C:\prepare ; `
    cp C:\mongodb-win32-x86_64-2008plus-ssl-$env:MONGO_VERSION\bin\*.dll C:\prepare

FROM mcr.microsoft.com/windows/servercore:ltsc2016

COPY --from=download C:\prepare C:\windows\system32

VOLUME C:\data\db

EXPOSE 27017

CMD ["mongod.exe"]
