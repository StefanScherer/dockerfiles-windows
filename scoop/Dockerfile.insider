FROM mcr.microsoft.com/windowsservercore-insider:10.0.17744.1001

ENV SCOOP "C:\scoop"
ENV SCOOP_HOME "C:\scoop\apps\scoop\current"

RUN powershell.exe -NoLogo -Command "iwr -UseBasicParsing 'https://get.scoop.sh' | iex;"

# ENTRYPOINT powershell.exe -NoLogo -NoExit
