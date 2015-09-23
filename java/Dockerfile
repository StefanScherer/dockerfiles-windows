FROM windowsservercore
MAINTAINER scherer_stefan@icloud.com

RUN powershell -Command "\
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install -y jdk8 -version 8.0.6001

CMD [ "java" ]
