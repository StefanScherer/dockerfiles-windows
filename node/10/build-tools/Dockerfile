ARG node=node:10.9.0-windowsservercore
FROM $node

RUN npm install --global --production --add-python-to-path windows-build-tools

ENV chocolateyUseWindowsCompression false

RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) ; \
    choco feature disable --name showDownloadProgress ; \
    choco install -y git-lfs
