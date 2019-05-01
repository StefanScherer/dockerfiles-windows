ARG TAG=ltsc2019
FROM mcr.microsoft.com/windows/servercore:$TAG
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN winrm quickconfig -q ; \
    winrm set winrm/config/service/Auth '@{Basic=\"true\"}' ; \
    winrm set winrm/config/service '@{AllowUnencrypted=\"true\"}' ; \
    winrm set winrm/config/winrs '@{MaxMemoryPerShellMB=\"1024\"}'

# Create a test account
RUN net user /add User03 Passw0rd ; \
    net localgroup Administrators User03 /add
