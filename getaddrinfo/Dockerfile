# regression test for https://github.com/docker/docker/issues/15889

FROM windowsservercore
RUN powershell -Command "Sleep 5 ; wget -Uri https://github.com/StefanScherer/win-getaddrinfo/releases/download/1.0.8/getaddrinfo.exe -OutFile getaddrinfo.exe -UseBasicParsing"
CMD [ cmd.exe ]
