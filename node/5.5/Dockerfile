FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 5.5.0
ENV NODE_SHA256 ba1dcd3035b045fb4ecb254bab1e0dda24934f2a773e6e05d0a54ac4adc4ee3b

RUN powershell -Command \
    Sleep 2 ; \
    wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing ; \
    if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Start-Process -FilePath msiexec -ArgumentList /q, /i, node.msi -Wait ; \
    Remove-Item -Path node.msi ; \
    wget -Uri https://github.com/StefanScherer/win-patch-iojs/releases/download/1.0.9/patchiojs.exe -OutFile patchiojs.exe -UseBasicParsing ; \
    patchiojs.exe 'C:/Program Files/nodejs/node.exe' ; \
    Remove-Item -Path patchiojs.exe

CMD [ "node.exe" ]
