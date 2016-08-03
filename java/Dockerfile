# escape=`
FROM microsoft/windowsservercore:10.0.14300.1030

RUN powershell -Command `
    wget 'http://javadl.oracle.com/webapps/download/AutoDL?BundleId=210185' -Outfile 'C:\jreinstaller.exe' ; `
    Start-Process -filepath C:\jreinstaller.exe -passthru -wait -argumentlist "/s,INSTALLDIR=c:\Java\jre1.8.0_91" ; `
    del C:\jreinstaller.exe

ENV JAVA_HOME c:\\Java\\jre1.8.0_91
RUN setx PATH %PATH%;%JAVA_HOME%\bin

CMD [ "java.exe" ]
