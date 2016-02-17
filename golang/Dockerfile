FROM windowsservercore

ENV GOLANG_VERSION 1.6
ENV GIT_VERSION 2.7.0

RUN mkdir \go\bin \go\src
WORKDIR /go
ENV GOPATH C:/go
RUN setx PATH %PATH%;C:\git\cmd;C:\git\bin;C:\git\usr\bin;C:\tools\go\bin;C:\go\bin

RUN powershell -Command \
    Sleep 2 ; \
    wget https://github.com/git-for-windows/git/releases/download/v%GIT_VERSION%.windows.1/Git-%GIT_VERSION%-64-bit.exe -outfile gitinstaller.exe ; \
    Start-Process .\gitinstaller.exe -ArgumentList '/VERYSILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /DIR=c:\git' -Wait ; \
    rm .\gitinstaller.exe

RUN powershell -Command \
    Sleep 2 ; \
    wget https://storage.googleapis.com/golang/go%GOLANG_VERSION%.windows-amd64.msi -outfile go.msi ; \
    Start-Process .\go.msi -ArgumentList '/quiet' -Wait ; \
    rm .\go.msi
