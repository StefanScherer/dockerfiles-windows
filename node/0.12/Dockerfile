FROM windowsservercore

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 0.12.7

RUN powershell -Command "wget -Uri https://nodejs.org/dist/v%NODE_VERSION%/x64/node-v%NODE_VERSION%-x64.msi -OutFile node.msi -UseBasicParsing"

RUN msiexec.exe /q /i node.msi

CMD [ "node" ]
