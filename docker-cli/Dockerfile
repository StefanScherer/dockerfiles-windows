FROM microsoft/windowsservercore as download

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV DOCKER_VERSION 18.06.0-ce

RUN Invoke-WebRequest 'http://constexpr.org/innoextract/files/innoextract-1.6-windows.zip' -OutFile 'innoextract.zip' -UseBasicParsing ; \
    Expand-Archive innoextract.zip -DestinationPath C:\ ; \
    Remove-Item -Path innoextract.zip

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; \
    Invoke-WebRequest $('https://github.com/docker/toolbox/releases/download/v{0}/DockerToolbox-{0}.exe' -f $env:DOCKER_VERSION) -OutFile 'dockertoolbox.exe' -UseBasicParsing
RUN /innoextract.exe dockertoolbox.exe

FROM microsoft/nanoserver:sac2016
COPY --from=download /app/docker.exe /
CMD [ "docker.exe" ]
