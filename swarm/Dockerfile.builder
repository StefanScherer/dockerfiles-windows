FROM microsoft/golang

ENV SWARM_VERSION v1.1.3
ENV GIT_VERSION 2.7.2
ENV GOPATH C:/go

WORKDIR /go

RUN setx PATH %PATH%;C:\git\cmd;C:\git\bin;C:\git\usr\bin

RUN powershell -Command \
    Sleep 2 ; \
    wget https://github.com/git-for-windows/git/releases/download/v%GIT_VERSION%.windows.1/Git-%GIT_VERSION%-64-bit.exe -outfile gitinstaller.exe ; \
    Start-Process .\gitinstaller.exe -ArgumentList '/VERYSILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /DIR=c:\git' -Wait ; \
    rm .\gitinstaller.exe

RUN powershell -Command \
    Sleep 2 ; \
    go get github.com/tools/godep ; \
    mkdir src\github.com\docker ; \
    cd src\github.com\docker ; \
    git clone https://github.com/docker/swarm ; \
    cd swarm ; \
    git checkout %SWARM_VERSION% ; \
    Start-Process -FilePath godep.exe -ArgumentList go, install, . -Wait
