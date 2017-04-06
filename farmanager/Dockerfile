FROM microsoft/windowsservercore

ENV chocolateyUseWindowsCompression false
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature enable -n allowGlobalConfirmation; \
    choco install far -version 3.0.4900

WORKDIR "C:\\Program Files\\Far Manager"

CMD .\Far.exe