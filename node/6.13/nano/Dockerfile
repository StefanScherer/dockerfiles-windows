FROM microsoft/windowsservercore:10.0.14393.2068 as download

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV GPG_VERSION 2.3.4

RUN Invoke-WebRequest $('https://files.gpg4win.org/gpg4win-vanilla-{0}.exe' -f $env:GPG_VERSION) -OutFile 'gpg4win.exe' -UseBasicParsing ; \
    Start-Process .\gpg4win.exe -ArgumentList '/S' -NoNewWindow -Wait

RUN @( \
    '94AE36675C464D64BAFA68DD7434390BDBE9B9C5', \
    'FD3A5288F042B6850C66B31F09FE44734EB7990E', \
    '71DCFD284A79C3B38668286BC97EC7A07EDE3FC1', \
    'DD8F2338BAE7501E3DD5AC78C273792F7D83545D', \
    'C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8', \
    'B9AE9905FFD7803F25714661B63B535A4C206CA9', \
    '56730D5401028683275BD23C23EFEFE93C4CFFFE', \
    '77984A986EBC2AA786BC0F66B01FBB92821C587A' \
    ) | foreach { \
      gpg --keyserver ha.pool.sks-keyservers.net --recv-keys $_ ; \
    }

ENV NODE_VERSION 6.13.0

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/SHASUMS256.txt.asc' -f $env:NODE_VERSION) -OutFile 'SHASUMS256.txt.asc' -UseBasicParsing ; \
    gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/node-v{0}-win-x64.zip' -f $env:NODE_VERSION) -OutFile 'node.zip' -UseBasicParsing ; \
    $sum = $(cat SHASUMS256.txt.asc | sls $('  node-v{0}-win-x64.zip' -f $env:NODE_VERSION)) -Split ' ' ; \
    if ((Get-FileHash node.zip -Algorithm sha256).Hash -ne $sum[0]) { Write-Error 'SHA256 mismatch' } ; \
    Expand-Archive node.zip -DestinationPath C:\ ; \
    Rename-Item -Path $('C:\node-v{0}-win-x64' -f $env:NODE_VERSION) -NewName 'C:\nodejs'

FROM microsoft/nanoserver:10.0.14393.2068

ENV NPM_CONFIG_LOGLEVEL info

COPY --from=download /nodejs /nodejs

RUN setx /m PATH "%PATH%;C:\nodejs"

CMD [ "node.exe" ]
