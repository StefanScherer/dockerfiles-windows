FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.0.0
ENV NODE_SHA256 28dfb26fddb3ff56456bfc0ec186db27e6b84d9ce98752f34d48758f4af05fbe

RUN powershell -Command " \
    wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing; \
    if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1}; \
    msiexec /q /i node.msi | Out-Null; \
    Remove-Item -Path node.msi; \
    wget -Uri https://github.com/StefanScherer/win-patch-iojs/releases/download/1.0.9/patchiojs.exe -OutFile patchiojs.exe -UseBasicParsing; \
    patchiojs.exe 'C:/Program Files/nodejs/node.exe'; \
    Remove-Item -Path patchiojs.exe; \
    "

CMD [ "node" ]
