FROM windowsservercore

ENV GOLANG_VERSION 1.5.1

RUN mkdir \go\bin \go\src
WORKDIR /go
ENV GOPATH C:/go
RUN setx PATH %PATH%;C:\PortableGit\bin;C:\PortableGit\usr\bin;C:\tools\go\bin;C:\go\bin

RUN powershell -Command \
    Sleep 2 ; \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) ; \
    choco install -y golang -version %GOLANG_VERSION% ; \
    wget https://github.com/git-for-windows/git/releases/download/v2.6.3.windows.1/PortableGit-2.6.3-64-bit.7z.exe -OutFile \gitinstaller.exe ; \
    Start-Process -FilePath \gitinstaller.exe -ArgumentList '-y', '-gm2' -Wait ; \
    rm \gitinstaller.exe
