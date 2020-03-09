FROM mcr.microsoft.com/windows/servercore:ltsc2016 AS download

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV PG_VERSION 11.7-1

RUN Invoke-WebRequest $('http://get.enterprisedb.com/postgresql/postgresql-{0}-windows-x64-binaries.zip' -f $env:PG_VERSION) -OutFile 'postgres.zip' -UseBasicParsing ; \
    Expand-Archive postgres.zip -DestinationPath C:\ ; \
    Remove-Item postgres.zip

RUN Invoke-WebRequest 'http://download.microsoft.com/download/0/6/4/064F84EA-D1DB-4EAA-9A5C-CC2F0FF6A638/vc_redist.x64.exe' -OutFile vcredist_x64.exe ; \
    Start-Process vcredist_x64.exe -ArgumentList '/install', '/passive', '/norestart' -NoNewWindow -Wait ; \
    Remove-Item vcredist_x64.exe

FROM mcr.microsoft.com/windows/nanoserver:10.0.14393.2068

COPY --from=download /pgsql /pgsql
COPY --from=download /windows/system32/VCRUNTIME140.dll /pgsql/bin/VCRUNTIME140.dll
COPY --from=download /windows/system32/msvcp140.dll /pgsql/bin/msvcp140.dll

RUN setx /M PATH "C:\pgsql\bin;%PATH%"

EXPOSE 5432
CMD ["postgres"]
