FROM microsoft/nanoserver:10.0.14393.1770 as download

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV DOCKER_VERSION 17.10.0-ce

RUN Invoke-WebRequest $('https://download.docker.com/win/static/edge/x86_64/docker-{0}.zip' -f $env:DOCKER_VERSION) -OutFile 'docker.zip' -UseBasicParsing ; \
    Expand-Archive docker.zip -DestinationPath C:\ ; \
    $env:PATH = 'C:\docker;{0}' -f $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; \
    Remove-Item -Path docker.zip ; \
    Remove-Item -Path docker\dockerd.exe

FROM microsoft/nanoserver:10.0.14393.1770
COPY --from=download docker/docker.exe /
CMD [ "docker.exe" ]
