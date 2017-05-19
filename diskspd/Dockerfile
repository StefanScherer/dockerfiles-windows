FROM microsoft/windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV DISKSPD_VERSION 2.0.17

RUN Invoke-WebRequest $('https://gallery.technet.microsoft.com/DiskSpd-a-robust-storage-6cd2f223/file/152702/1/Diskspd-v{0}.zip' -f $env:DISKSPD_VERSION) -OutFile 'diskspd.zip' -UseBasicParsing ; \
    Expand-Archive diskspd.zip -DestinationPath C:\ ; \
    Remove-Item -Path diskspd.zip ; \
    Remove-Item -Recurse armfre ; \
    Remove-Item -Recurse x86fre ; \
    Remove-Item *.docx ; \
    Remove-Item *.pdf

ENTRYPOINT [ "C:\\amd64fre\\diskspd.exe" ]
