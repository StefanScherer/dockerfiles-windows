FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.1.1
ENV NODE_SHA256 04b65daa09c1daff6d0a4101a3256d18eb9d5b50ba3ba49184b5b032dd9a4c06

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
