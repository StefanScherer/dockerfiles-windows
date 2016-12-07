FROM microsoft/windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.7.0
ENV NODE_SHA256 8b257f217ad882deffc2cd37d3aed7b8bbe57da1c4eb0b3b54cb529dff8ce811

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/node-v{0}-win-x64.zip' -f $env:NODE_VERSION) -OutFile 'node.zip' -UseBasicParsing ; \
    if ((Get-FileHash node.zip -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Expand-Archive node.zip -DestinationPath C:\ ; \
    Rename-Item -Path $('C:\node-v{0}-win-x64' -f $env:NODE_VERSION) -NewName 'C:\nodejs' ; \
    New-Item $($env:APPDATA + '\npm') ; \
    $env:PATH = 'C:\nodejs;{0}\npm;{1}' -f $env:APPDATA, $env:PATH ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine) ; \
    Remove-Item -Path node.zip

CMD [ "node.exe" ]
