FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6.1.0
ENV NODE_SHA256 b32b1105da5c08023976717d9aaeb0e3ba93d09f170aa3d81ad8ddfb0abfbdd4

RUN powershell -Command \
    wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing ; \
    if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Start-Process -FilePath msiexec -ArgumentList /q, /i, node.msi -Wait ; \
    Remove-Item -Path node.msi

CMD [ "node.exe" ]
