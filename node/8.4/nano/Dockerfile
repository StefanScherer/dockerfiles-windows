# escape=`
FROM microsoft/windowsservercore-insider as download

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV GPG_VERSION 2.3.4

RUN Invoke-WebRequest $('https://files.gpg4win.org/gpg4win-vanilla-{0}.exe' -f $env:GPG_VERSION) -OutFile 'gpg4win.exe' -UseBasicParsing ; `
    Start-Process .\gpg4win.exe -ArgumentList '/S' -NoNewWindow -Wait

RUN @( `
    '9554F04D7259F04124DE6B476D5A82AC7E37093B', `
    '94AE36675C464D64BAFA68DD7434390BDBE9B9C5', `
    'FD3A5288F042B6850C66B31F09FE44734EB7990E', `
    '71DCFD284A79C3B38668286BC97EC7A07EDE3FC1', `
    'DD8F2338BAE7501E3DD5AC78C273792F7D83545D', `
    'B9AE9905FFD7803F25714661B63B535A4C206CA9', `
    'C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8', `
    '56730D5401028683275BD23C23EFEFE93C4CFFFE' `
    ) | foreach { `
      gpg --keyserver ha.pool.sks-keyservers.net --recv-keys $_ ; `
    }

ENV NODE_VERSION 8.4.0

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/SHASUMS256.txt.asc' -f $env:NODE_VERSION) -OutFile 'SHASUMS256.txt.asc' -UseBasicParsing ; `
    gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc

RUN Invoke-WebRequest $('https://nodejs.org/dist/v{0}/node-v{0}-win-x64.zip' -f $env:NODE_VERSION) -OutFile 'node.zip' -UseBasicParsing ; `
    $sum = $(cat SHASUMS256.txt.asc | sls $('  node-v{0}-win-x64.zip' -f $env:NODE_VERSION)) -Split ' ' ; `
    if ((Get-FileHash node.zip -Algorithm sha256).Hash -ne $sum[0]) { Write-Error 'SHA256 mismatch' } ; `
    Expand-Archive node.zip -DestinationPath C:\ ; `
    Rename-Item -Path $('C:\node-v{0}-win-x64' -f $env:NODE_VERSION) -NewName 'C:\nodejs'

ENV YARN_VERSION 0.27.5

RUN @( `
    '6A010C5166006599AA17F08146C2130DFD2497F5' `
    ) | foreach { `
      gpg --keyserver ha.pool.sks-keyservers.net --recv-keys $_ ; `
    }

RUN $asc =  $('yarn-v{0}.tar.gz.asc' -f $env:YARN_VERSION) ; `
    $tarGz =  $('yarn-v{0}.tar.gz' -f $env:YARN_VERSION) ; `
    Invoke-WebRequest $('https://yarnpkg.com/downloads/{0}/yarn-v{0}.tar.gz.asc' -f $env:YARN_VERSION) -OutFile $asc -UseBasicParsing ; `
    Invoke-WebRequest $('https://yarnpkg.com/downloads/{0}/yarn-v{0}.tar.gz' -f $env:YARN_VERSION) -OutFile $tarGz -UseBasicParsing ; `
    gpg --batch --verify $asc $tarGz

ENV MHOLT_ARCHIVER_VERSION 2.0
ENV MHOLT_ARCHIVER_SHA256 c23eab86a8f77e446f2b5dbb03305ac9acfb5187108a0090a4bcb3d908fa9785

RUN Invoke-WebRequest $('https://github.com/mholt/archiver/releases/download/v{0}/archiver_windows_amd64.exe' -f $env:MHOLT_ARCHIVER_VERSION) -OutFile archiver.exe -UseBasicParsing ; `
    if ((Get-FileHash archiver.exe -Algorithm sha256).Hash -ne $env:MHOLT_ARCHIVER_SHA256) { Write-Error 'SHA256 mismatch' }

RUN .\archiver.exe open yarn-v$($env:YARN_VERSION).tar.gz ; `
    mv dist yarn

FROM microsoft/nanoserver-insider

ENV NPM_CONFIG_LOGLEVEL info

COPY --from=download /nodejs /nodejs
COPY --from=download /yarn /yarn

USER ContainerAdministrator
RUN setx /m PATH "%PATH%;C:\nodejs;C:\yarn\bin;%APPDATA%\npm"
USER ContainerUser

CMD [ "node.exe" ]
