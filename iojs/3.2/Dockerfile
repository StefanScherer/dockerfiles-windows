FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV IOJS_VERSION 3.2.0

RUN powershell -Command "wget -Uri https://iojs.org/dist/v%IOJS_VERSION%/iojs-v%IOJS_VERSION%-x64.msi -OutFile iojs.msi -UseBasicParsing"

RUN msiexec.exe /q /i iojs.msi

RUN powershell -Command "wget -Uri https://github.com/StefanScherer/win-patch-iojs/releases/download/1.0.9/patchiojs.exe -OutFile patchiojs.exe -UseBasicParsing"
RUN patchiojs.exe "C:/Program Files/iojs/iojs.exe"

CMD [ "iojs" ]
