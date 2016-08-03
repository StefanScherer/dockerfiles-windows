FROM microsoft/windowsservercore:10.0.14300.1030
MAINTAINER scherer_stefan@icloud.com

RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install -y curl

ENTRYPOINT [ "C:\\ProgramData\\chocolatey\\bin\\curl.exe" ]
