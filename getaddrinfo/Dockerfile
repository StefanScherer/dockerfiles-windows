# regression test for https://github.com/docker/docker/issues/15889

FROM microsoft/windowsservercore:10.0.14393.1770

RUN powershell -Command Sleep 2 ; wget -Uri https://github.com/StefanScherer/win-getaddrinfo/releases/download/1.0.8/getaddrinfo.exe -OutFile C:\Windows\system32\getaddrinfo.exe -UseBasicParsing

CMD [ "cmd.exe" ]
