FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.4.3
ENV NODE_SHA256 388197c171805d97746d29b64d1e98c87dca378e70d5e947875327772bb2d560

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
