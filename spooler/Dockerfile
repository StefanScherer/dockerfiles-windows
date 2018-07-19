FROM mcr.microsoft.com/windows-insider
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN Set-Service -Name spooler -StartupType Automatic
RUN Get-Printer
