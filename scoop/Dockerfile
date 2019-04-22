ARG version=ltsc2016
FROM mcr.microsoft.com/windows/servercore:$version

ENV SCOOP "C:\scoop"
ENV SCOOP_HOME "C:\scoop\apps\scoop\current"

RUN powershell.exe -NoLogo -Command "iwr -UseBasicParsing 'https://get.scoop.sh' | iex;"

# ENTRYPOINT powershell.exe -NoLogo -NoExit
