FROM microsoft/nanoserver

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 7.2.0
ENV NODE_SHA256 887c207972cdc191953dbcfa7b4a3f13667063a9aa82e471c779247c555722d5

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/node-v{0}-win-x64.zip' -f $env:NODE_VERSION) -OutFile 'node.zip' -UseBasicParsing ; \
		if ((Get-FileHash node.zip -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    [System.IO.Compression.ZipFile]::ExtractToDirectory('C:\node.zip', 'C:\') ; \
    Rename-Item -Path $('C:\node-v{0}-win-x64' -f $env:NODE_VERSION) -NewName 'C:\nodejs' ; \
    New-Item $($env:APPDATA + '\npm') ; \
    $env:PATH = 'C:\nodejs;{0}\npm;{1}' -f $env:APPDATA, $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; \
    Remove-Item -Path node.zip

CMD [ "node.exe" ]
