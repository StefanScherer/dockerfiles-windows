FROM microsoft/windowsservercore:10.0.14393.2007

RUN reg add "HKCU\SOFTWARE\Sysinternals\Process Monitor" /v EulaAccepted /t REG_DWORD /d 1
ADD https://live.sysinternals.com/procmon.exe procmon.exe
