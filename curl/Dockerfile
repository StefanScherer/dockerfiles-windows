FROM microsoft/windowsservercore
MAINTAINER scherer_stefan@icloud.com

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install -y curl

# REMARK: Temporary workaround for Windows DNS client weirdness
RUN powershell -command set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord

ENTRYPOINT [ "C:\\ProgramData\\chocolatey\\bin\\curl.exe" ]
