FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV chocolateyUseWindowsCompression false

RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature disable --name showDownloadProgress

ENV NODE_VERSION 10.16.3
ENV GO_VERSION 1.12.9

RUN choco install -y nodejs -version $env:NODE_VERSION ; \
    choco install -y golang -version $env:GO_VERSION

RUN npm install -g yarn

ENV FOSSA_VERSION 1.0.4

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; \
    Invoke-WebRequest $('https://github.com/fossas/fossa-cli/releases/download/v{0}/fossa-cli_{0}_windows_amd64.zip' -f $env:FOSSA_VERSION) -OutFile fossa.zip ; \
    Expand-Archive fossa.zip -DestinationPath C:\fossa; \
    Remove-Item fossa.zip

RUN $env:PATH = 'C:\fossa;{0}' -f $env:PATH ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

ENTRYPOINT [ "fossa.exe" ]
CMD [ "--version" ]
