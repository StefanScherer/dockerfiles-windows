FROM microsoft/windowsservercore:1709

ADD https://github.com/mholt/archiver/releases/download/v2.0/archiver_windows_amd64.exe /archiver.exe

# Download AppVeyor artifact
# ADD https://ci.appveyor.com/api/buildjobs/walv0m7b2q4uvfkh/artifacts/bin%2FRelease%2FPSReadline.zip /PSReadline.zip
#ADD https://ci.appveyor.com/api/buildjobs/7a8c12u72q6h2v53/artifacts/bin%2FRelease%2FPSReadline.zip /PSReadline.zip
#ADD https://ci.appveyor.com/api/buildjobs/dx6ax0j8ajsh5vvr/artifacts/bin%2FRelease%2FPSReadline.zip /PSReadline.zip
ADD https://ci.appveyor.com/api/buildjobs/59ok9yym97x0jbc4/artifacts/bin%2FRelease%2FPSReadline.zip /PSReadline.zip

RUN archiver.exe open PSReadline.zip tmp

FROM microsoft/windowsservercore:1709

WORKDIR "Program Files"
RUN rd /S /Q WindowsPowerShell\Modules\PSReadLine
WORKDIR /

COPY --from=0 [ "/tmp/PSReadline", "/Users/ContainerAdministrator/Documents/WindowsPowerShell/Modules/PSReadLine/" ]
#COPY --from=0 [ "/tmp/PSReadline", "/Program Files/WindowsPowerShell/Modules/PSReadLine/1.2/" ]
#COPY --from=0 [ "/tmp/PSReadline/Microsoft.PowerShell.PSReadLine.dll", "/Program Files/WindowsPowerShell/Modules/PSReadLine/1.2/Microsoft.PowerShell.PSReadLine.dll" ]
#COPY --from=0 [ "/tmp/PSReadline/PSReadLine.psd1", "/Program Files/WindowsPowerShell/Modules/PSReadLine/1.2/PSReadLine.psd1" ]
#COPY --from=0 [ "/tmp/PSReadline/PSReadLine.psm1", "/Program Files/WindowsPowerShell/Modules/PSReadLine/1.2/PSReadLine.psm1" ]
