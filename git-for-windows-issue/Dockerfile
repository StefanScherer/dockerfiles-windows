FROM microsoft/windowsservercore:10.0.14393.1770

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV chocolateyUseWindowsCompression false

RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install -y git -params "/GitAndUnixToolsOnPath"

RUN git --version --build-options
RUN cmd.exe /c ver
RUN type 'C:\Program Files\Git\etc\install-options.txt'

# these install-options.txt files do not exist
# RUN type 'C:\Program Files (x86)\Git\etc\install-options.txt'
# RUN type ('{0}\AppData\Local\Programs\Git\etc\install-options.txt' -f $env:USERPROFILE)
# RUN cat /etc/install-options.txt

RUN mkdir C:\work
WORKDIR C:\\work
