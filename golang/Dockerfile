FROM windowsservercore

ENV GOLANG_VERSION 1.6
ENV GIT_VERSION 2.7.0

RUN mkdir \go\bin \go\src
WORKDIR /go
ENV GOPATH C:/go
RUN setx PATH %PATH%;C:\git\cmd;C:\git\bin;C:\git\usr\bin;C:\tools\go\bin;C:\go\bin

RUN powershell -Command \
    Sleep 2 ; \
    cd \ ; \
    wget https://chocolatey.org/7za.exe -outfile 7za.exe ; \
    wget https://github.com/git-for-windows/git/releases/download/v%GIT_VERSION%.windows.1/Git-%GIT_VERSION%-64-bit.tar.bz2 -outfile git.tar.bz2 ; \
    .\7za.exe x git.tar.bz2 ; \
    mkdir git ; \
    cd git ; \
    ..\7za.exe x ..\git.tar ; \
    cd .. ; \
    rm git.tar ; \
    rm git.tar.bz2 ; \
    rm 7za.exe

RUN powershell -Command \
    Sleep 2 ; \
    cd \ ; \
    wget https://chocolatey.org/7za.exe -outfile 7za.exe ; \
    wget https://storage.googleapis.com/golang/go%GOLANG_VERSION%.windows-amd64.zip -outfile go.zip ; \
    .\7za.exe x go.zip ; \
    rm go.zip ; \
    rm 7za.exe
