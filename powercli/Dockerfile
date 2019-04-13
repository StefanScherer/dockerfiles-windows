FROM mcr.microsoft.com/windows/servercore:ltsc2016

ENV POWERCLI_VERSION 6.5.4.7155375

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force ; \
    Install-Module -Name VMware.PowerCLI -RequiredVersion $env:POWERCLI_VERSION -Force ; \
    mkdir $env:APPDATA\VMware\PowerCLI ; \
    'Import-Module VMware.PowerCli' > $PROFILE ; \
    '<Settings><Setting Name=\"ParticipateInCEIP\" Value=\"False\" /></Settings>' >$env:APPDATA\VMware\PowerCLI\PowerCLI_Settings.xml

ENTRYPOINT [ "powershell.exe" ]

