FROM mcr.microsoft.com/windows/servercore:ltsc2016 AS download

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV PG_VERSION 10.2-1

RUN Invoke-WebRequest $('https://get.enterprisedb.com/postgresql/postgresql-{0}-windows-x64-binaries.zip' -f $env:PG_VERSION) -OutFile 'postgres.zip' -UseBasicParsing ; \
    Expand-Archive postgres.zip -DestinationPath C:\ ; \
    Remove-Item postgres.zip

RUN Invoke-WebRequest 'http://download.microsoft.com/download/0/5/6/056DCDA9-D667-4E27-8001-8A0C6971D6B1/vcredist_x64.exe' -OutFile vcredist_x64.exe ; \
    Start-Process vcredist_x64.exe -ArgumentList '/install', '/passive', '/norestart' -NoNewWindow -Wait ; \
    Remove-Item vcredist_x64.exe

FROM mcr.microsoft.com/windows/nanoserver:10.0.14393.2068

COPY --from=download /pgsql /pgsql
COPY --from=download /windows/system32/msvcp120.dll /pgsql/bin/msvcp120.dll
COPY --from=download /windows/system32/msvcr120.dll /pgsql/bin/msvcr120.dll

RUN setx /M PATH "C:\pgsql\bin;%PATH%"

EXPOSE 5432
CMD ["postgres"]
