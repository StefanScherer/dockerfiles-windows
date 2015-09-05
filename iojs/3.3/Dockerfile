FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV IOJS_VERSION 3.3.0
ENV IOJS_SHA256 68289641c2780e8c34fc9d4c1c92290d5adb7612b4979722523d6212c79bb0d0

RUN powershell -Command " \
    wget -Uri https://iojs.org/dist/v%IOJS_VERSION%/iojs-v%IOJS_VERSION%-x64.msi -OutFile iojs.msi -UseBasicParsing; \
    if ((Get-FileHash iojs.msi -Algorithm sha256).Hash -ne $env:IOJS_SHA256) {exit 1}; \
    msiexec /q /i iojs.msi | Out-Null; \
    Remove-Item -Path iojs.msi; \
    wget -Uri https://github.com/StefanScherer/win-patch-iojs/releases/download/1.0.9/patchiojs.exe -OutFile patchiojs.exe -UseBasicParsing; \
    patchiojs.exe 'C:/Program Files/iojs/iojs.exe'; \
    Remove-Item -Path patchiojs.exe; \
    "

CMD [ "iojs" ]
