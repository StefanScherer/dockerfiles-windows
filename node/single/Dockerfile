FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.2.1
ENV NODE_SHA256 e460a71ea9aa4d743387a20319042de203de837cb613be0737b6ca368480302d

RUN powershell.exe -Command "wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing;"
RUN powershell.exe -Command "if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1};"
RUN msiexec.exe /q /i node.msi
RUN powershell.exe -Command "wget -Uri https://github.com/StefanScherer/win-patch-iojs/releases/download/1.0.9/patchiojs.exe -OutFile patchiojs.exe -UseBasicParsing;"
RUN patchiojs.exe 'C:/Program Files/nodejs/node.exe';

CMD [ "node.exe" ]
