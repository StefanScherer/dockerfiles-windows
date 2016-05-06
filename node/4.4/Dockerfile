FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.4.4
ENV NODE_SHA256 3bfa87c9feb0107800740fd0a7f950b9259ba73a353274ba60a91d7b4a5279c5

RUN powershell -Command \
    wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing ; \
    if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Start-Process -FilePath msiexec -ArgumentList /q, /i, node.msi -Wait ; \
    Remove-Item -Path node.msi

CMD [ "node.exe" ]
