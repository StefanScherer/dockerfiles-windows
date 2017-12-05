FROM microsoft/windowsservercore:10.0.14393.1884

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
