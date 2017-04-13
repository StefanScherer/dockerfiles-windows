# escape=`
FROM microsoft/windowsservercore as msi

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV MONGO_VERSION 3.4.2
ENV MONGO_DOWNLOAD_URL http://downloads.mongodb.org/win32/mongodb-win32-x86_64-2008plus-ssl-${MONGO_VERSION}-signed.msi
ENV MONGO_DOWNLOAD_SHA256 ff8a4226de8a8d766ae0713dd94663e965cc0505540026e2483cb6351a55eb23

RUN Write-Host ('Downloading {0} ...' -f $env:MONGO_DOWNLOAD_URL)
RUN Invoke-WebRequest -Uri $env:MONGO_DOWNLOAD_URL -OutFile 'mongodb.msi'
RUN Write-Host ('Verifying sha256 ({0}) ...' -f $env:MONGO_DOWNLOAD_SHA256)
RUN if ((Get-FileHash mongodb.msi -Algorithm sha256).Hash -ne $env:MONGO_DOWNLOAD_SHA256) { `
      Write-Host 'FAILED!'; `
      exit 1; `
    }
RUN Start-Process msiexec.exe -ArgumentList '/i', 'mongodb.msi', '/quiet', '/norestart', 'INSTALLLOCATION=C:\mongodb', 'ADDLOCAL=Server,Client,MonitoringTools,ImportExportTools,MiscellaneousTools' -NoNewWindow -Wait
RUN Remove-Item C:\mongodb\bin\*.pdb

FROM microsoft/nanoserver

COPY --from=msi C:\mongodb\ C:\mongodb\
COPY --from=msi C:\windows\system32\msvcp140.dll C:\mongodb\bin
COPY --from=msi C:\windows\system32\vcruntime140.dll C:\mongodb\bin

RUN mkdir C:\data\db & setx /m PATH %PATH%;C:\mongodb\bin

VOLUME C:\data\db

EXPOSE 27017

CMD ["mongod.exe"]
