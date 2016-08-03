FROM microsoft/windowsservercore:10.0.14300.1030

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6.3.1
ENV NODE_SHA256 d41bb2d45bbd2dde7539c7c7e4f80865979f0bb15e6af0e7ee9460d9ad47c8ec

RUN powershell -Command \
    wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing ; \
    if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Start-Process -FilePath msiexec -ArgumentList /q, /i, node.msi -Wait ; \
    Remove-Item -Path node.msi

CMD [ "node.exe" ]
