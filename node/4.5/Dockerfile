FROM microsoft/windowsservercore:10.0.14300.1030

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.5.0
ENV NODE_SHA256 367a1872bac36bfd398b89027df80c9c0e604a466185ad4631c167ba1a5d24c8

RUN powershell -Command \
    wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing ; \
    if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Start-Process -FilePath msiexec -ArgumentList /q, /i, node.msi -Wait ; \
    Remove-Item -Path node.msi

CMD [ "node.exe" ]
