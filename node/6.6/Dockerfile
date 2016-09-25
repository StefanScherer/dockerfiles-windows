FROM microsoft/windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6.6.0
ENV NODE_SHA256 5b1c49f8fd36bd9c277259773f42832db74c41f87033deaccfbd82e15330bae4

RUN powershell -Command \
    $ErrorActionPreference = 'Stop' ; \
    (New-Object System.Net.WebClient).DownloadFile('https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-win-x64.zip', 'node.zip') ; \
    if ((Get-FileHash node.zip -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Expand-Archive node.zip -DestinationPath C:\ ; \
    Rename-Item 'C:\node-v%NODE_VERSION%-win-x64' 'C:\nodejs' ; \
    New-Item '%APPDATA%\npm' ; \
    $env:PATH = 'C:\nodejs;%APPDATA%\npm;' + $env:PATH ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine) ; \
    Remove-Item -Path node.zip

CMD [ "node.exe" ]
