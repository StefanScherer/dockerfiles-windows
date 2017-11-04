# escape=`
FROM microsoft/windowsservercore:10.0.14393.1770 AS tar
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV MHOLT_ARCHIVER_VERSION 2.0
ENV MHOLT_ARCHIVER_SHA256 c23eab86a8f77e446f2b5dbb03305ac9acfb5187108a0090a4bcb3d908fa9785

RUN Invoke-WebRequest $('https://github.com/mholt/archiver/releases/download/v{0}/archiver_windows_amd64.exe' -f $env:MHOLT_ARCHIVER_VERSION) -OutFile archiver.exe -UseBasicParsing ; `
    if ((Get-FileHash archiver.exe -Algorithm sha256).Hash -ne $env:MHOLT_ARCHIVER_SHA256) { Write-Error 'SHA256 mismatch' }

ENV PROMETHEUS_VERSION 1.8.1

RUN Invoke-WebRequest $('https://github.com/prometheus/prometheus/releases/download/v{0}/prometheus-{0}.windows-amd64.tar.gz' -f $env:PROMETHEUS_VERSION) -OutFile 'prometheus.tar.gz' -UseBasicParsing
RUN .\archiver.exe open prometheus.tar.gz
RUN Rename-Item -Path $('C:\prometheus-{0}.windows-amd64' -f $env:PROMETHEUS_VERSION) -NewName 'C:\download'

FROM microsoft/nanoserver:10.0.14393.1770

COPY --from=tar /download/prometheus.exe      /bin/prometheus.exe
COPY --from=tar /download/promtool.exe        /bin/promtool.exe
COPY --from=tar /download/prometheus.yml      /etc/prometheus/prometheus.yml
COPY --from=tar /download/console_libraries/  /etc/prometheus/
COPY --from=tar /download/consoles/           /etc/prometheus/

EXPOSE     9090
VOLUME     C:\prometheus
WORKDIR    C:\prometheus
ENTRYPOINT [ "C:\\bin\\prometheus.exe" ]
CMD        [ "-config.file=/etc/prometheus/prometheus.yml", `
             "-storage.local.path=/prometheus", `
             "-web.console.libraries=/etc/prometheus/console_libraries", `
             "-web.console.templates=/etc/prometheus/consoles" ]
