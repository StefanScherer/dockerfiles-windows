FROM microsoft/windowsservercore:10.0.14300.1030

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6.4.0
ENV NODE_SHA256 c2f9970ff7402078f4210f981f96672c28bba018b4390517cbc4a1a785a4b7b7

RUN powershell -Command \
    wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing ; \
    if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Start-Process -FilePath msiexec -ArgumentList /q, /i, node.msi -Wait ; \
    Remove-Item -Path node.msi

CMD [ "node.exe" ]
