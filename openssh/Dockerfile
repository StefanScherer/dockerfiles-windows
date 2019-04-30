ARG TAG=ltsc2019
FROM mcr.microsoft.com/windows/servercore:$TAG
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
ENV SPINNER_VERSION 1.0.8
COPY install-openssh.ps1 install-openssh.ps1
RUN ./install-openssh.ps1

# Create a test account
RUN net user /add User03 Passw0rd

# Install Spinner to watch a Windows service
RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; \
    Invoke-WebRequest $('https://github.com/ticketmaster/spinner/releases/download/v{0}/spinner_windows_amd64-v{0}.zip' -f $env:SPINNER_VERSION) -OutFile spinner.zip -UseBasicParsing ; \
    Expand-Archive spinner.zip ; \
    Remove-Item spinner.zip ; \
    Move-Item spinner\spinner_v$env:SPINNER_VERSION.exe spinner.exe ; \
    Remove-Item spinner
CMD Start-Sleep 5 ; ./spinner.exe service sshd -t C:\ProgramData\ssh\logs\sshd.log
