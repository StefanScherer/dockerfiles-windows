FROM mcr.microsoft.com/windows/servercore:ltsc2016

RUN powershell.exe -Command Sleep 2 ; wget -Uri https://github.com/StefanScherer/win-print-commandline/releases/download/1.0.3/printcommandline.exe -OutFile printcommandline.exe -UseBasicParsing
RUN printcommandline.exe C:\Program Files
RUN printcommandline.exe 'C:\Program Files'
RUN printcommandline.exe "C:\Program Files"
RUN printcommandline.exe C:/Program Files
RUN printcommandline.exe 'C:/Program Files'
RUN printcommandline.exe "C:/Program Files"
RUN printcommandline.exe %ProgramFiles%
RUN printcommandline.exe '%ProgramFiles%'
RUN printcommandline.exe "%ProgramFiles%"

CMD [ "printcommandline.exe" ]
