FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info \
    NODE_VERSION 4.4.0 \
    NODE_SHA256 c87245838da77c601b38752626da8344b8874bedc3fa7d8634924cb70a801fe7

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
