FROM microsoft/windowsservercore:10.0.14300.1030
RUN dism /online /enable-feature /all /featurename:iis-webserver /NoRestart
RUN echo "Hello World - Dockerfile" > c:\inetpub\wwwroot\index.html
CMD [ "powershell.exe", "Sleep", "120" ]
