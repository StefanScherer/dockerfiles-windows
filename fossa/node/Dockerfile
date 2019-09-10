ARG NODE_VERSION=10.16.3

FROM stefanscherer/node-windows:$NODE_VERSION-windowsservercore-2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV FOSSA_VERSION 1.0.4

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; \
    Invoke-WebRequest $('https://github.com/fossas/fossa-cli/releases/download/v{0}/fossa-cli_{0}_windows_amd64.zip' -f $env:FOSSA_VERSION) -OutFile fossa.zip ; \
    Expand-Archive fossa.zip -DestinationPath C:\fossa; \
    Remove-Item fossa.zip

RUN $env:PATH = 'C:\fossa;{0}' -f $env:PATH ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

CMD [ "fossa.exe" ]
