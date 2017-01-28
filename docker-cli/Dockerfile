FROM microsoft/nanoserver

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV DOCKER_VERSION 1.13.0

RUN Invoke-WebRequest $('https://get.docker.com/builds/Windows/x86_64/docker-{0}.zip' -f $env:DOCKER_VERSION) -OutFile 'docker.zip' -UseBasicParsing ; \
    Expand-Archive docker.zip -DestinationPath C:\ ; \
    $env:PATH = 'C:\docker;{0}' -f $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; \
    Remove-Item -Path docker.zip ; \
    Remove-Item -Path docker\dockerd.exe

CMD [ "docker.exe" ]
