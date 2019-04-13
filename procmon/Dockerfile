FROM mcr.microsoft.com/windows/servercore:ltsc2016

RUN reg add "HKCU\SOFTWARE\Sysinternals\Process Monitor" /v EulaAccepted /t REG_DWORD /d 1
ADD https://live.sysinternals.com/procmon.exe procmon.exe
