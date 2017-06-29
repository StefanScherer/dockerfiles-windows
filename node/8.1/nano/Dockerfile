FROM microsoft/windowsservercore as download

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV GPG_VERSION 2.3.3

RUN Invoke-WebRequest $('https://files.gpg4win.org/gpg4win-vanilla-{0}.exe' -f $env:GPG_VERSION) -OutFile 'gpg4win.exe' -UseBasicParsing ; \
    Start-Process .\gpg4win.exe -ArgumentList '/S' -NoNewWindow -Wait

RUN @( \
    '9554F04D7259F04124DE6B476D5A82AC7E37093B', \
    '94AE36675C464D64BAFA68DD7434390BDBE9B9C5', \
    'FD3A5288F042B6850C66B31F09FE44734EB7990E', \
    '71DCFD284A79C3B38668286BC97EC7A07EDE3FC1', \
    'DD8F2338BAE7501E3DD5AC78C273792F7D83545D', \
    'B9AE9905FFD7803F25714661B63B535A4C206CA9', \
    'C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8', \
    '56730D5401028683275BD23C23EFEFE93C4CFFFE' \
    ) | foreach { \
      gpg --keyserver ha.pool.sks-keyservers.net --recv-keys $_ ; \
    }

ENV NODE_VERSION 8.1.3

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/SHASUMS256.txt.asc' -f $env:NODE_VERSION) -OutFile 'SHASUMS256.txt.asc' -UseBasicParsing ; \
    gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/node-v{0}-win-x64.zip' -f $env:NODE_VERSION) -OutFile 'node.zip' -UseBasicParsing ; \
    $sum = $(cat SHASUMS256.txt.asc | sls $('  node-v{0}-win-x64.zip' -f $env:NODE_VERSION)) -Split ' ' ; \
    if ((Get-FileHash node.zip -Algorithm sha256).Hash -ne $sum[0]) { Write-Error 'SHA256 mismatch' } ; \
    Expand-Archive node.zip -DestinationPath C:\ ; \
    Rename-Item -Path $('C:\node-v{0}-win-x64' -f $env:NODE_VERSION) -NewName 'C:\nodejs'

FROM microsoft/nanoserver

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV NPM_CONFIG_LOGLEVEL info

COPY --from=download /nodejs /nodejs

RUN New-Item $($env:APPDATA + '\npm') ; \
    $env:PATH = 'C:\nodejs;{0}\npm;{1}' -f $env:APPDATA, $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH

CMD [ "node.exe" ]
