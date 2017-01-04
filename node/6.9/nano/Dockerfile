FROM microsoft/nanoserver

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6.9.3
ENV NODE_SHA256 bda76db75bed655b5b8f01022f33ca7e61b8be175b871dcc218bdf84f6403a1f

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/node-v{0}-win-x64.zip' -f $env:NODE_VERSION) -OutFile 'node.zip' -UseBasicParsing ; \
		if ((Get-FileHash node.zip -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Expand-Archive node.zip -DestinationPath C:\ ; \
    Rename-Item -Path $('C:\node-v{0}-win-x64' -f $env:NODE_VERSION) -NewName 'C:\nodejs' ; \
    New-Item $($env:APPDATA + '\npm') ; \
    $env:PATH = 'C:\nodejs;{0}\npm;{1}' -f $env:APPDATA, $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; \
    Remove-Item -Path node.zip

CMD [ "node.exe" ]
