FROM microsoft/nanoserver

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.6.0
ENV NODE_SHA256 0782bd50251c2a159fba5b874c56fb4a6680f454cc16892cee8e62d17b7d6f60

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/node-v{0}-win-x64.zip' -f $env:NODE_VERSION) -OutFile 'node.zip' -UseBasicParsing ; \
    [System.IO.Compression.ZipFile]::ExtractToDirectory('C:\node.zip', 'C:\') ; \
    Rename-Item -Path $('C:\node-v{0}-win-x64' -f $env:NODE_VERSION) -NewName 'C:\nodejs' ; \
    New-Item $($env:APPDATA + '\npm') ; \
    $env:PATH = 'C:\nodejs;{0}\npm;{1}' -f $env:APPDATA, $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; \
    Remove-Item -Path node.zip

CMD [ "node.exe" ]
