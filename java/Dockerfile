FROM windowsservercore
MAINTAINER scherer_stefan@icloud.com

RUN powershell -Command \
    Sleep 2; \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install -y jdk7 -version 7.0.79.1

CMD [ "java" ]
