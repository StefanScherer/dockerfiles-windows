# escape=`
FROM microsoft/windowsservercore AS tar
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN Invoke-WebRequest 'http://www.7-zip.org/a/7z1604-x64.msi' -OutFile '7z.msi' -UseBasicParsing
RUN Start-Process msiexec.exe -ArgumentList '/i', '7z.msi', '/quiet', '/norestart' -NoNewWindow -Wait

ENV PROMETHEUS_VERSION 1.7.0

RUN Invoke-WebRequest $('https://github.com/prometheus/prometheus/releases/download/v{0}/prometheus-{0}.windows-amd64.tar.gz' -f $env:PROMETHEUS_VERSION) -OutFile 'prometheus.tar.gz' -UseBasicParsing
RUN & 'C:\Program Files\7-Zip\7z.exe' x prometheus.tar.gz
RUN & 'C:\Program Files\7-Zip\7z.exe' x prometheus.tar
RUN Rename-Item -Path $('C:\prometheus-{0}.windows-amd64' -f $env:PROMETHEUS_VERSION) -NewName 'C:\download'

FROM microsoft/nanoserver

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
