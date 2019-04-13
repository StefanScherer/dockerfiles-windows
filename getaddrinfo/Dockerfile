# regression test for https://github.com/docker/docker/issues/15889

FROM mcr.microsoft.com/windows/servercore:ltsc2016

RUN powershell -Command Sleep 2 ; wget -Uri https://github.com/StefanScherer/win-getaddrinfo/releases/download/1.0.8/getaddrinfo.exe -OutFile C:\Windows\system32\getaddrinfo.exe -UseBasicParsing

CMD [ "cmd.exe" ]
