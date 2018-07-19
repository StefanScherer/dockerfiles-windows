# spooler

The Windows spooler service can be enabled in the new full Windows Docker
images of the latest Server 2019 Insider builds.

```
$ docker build --isolation hyperv --no-cache -t print .
Sending build context to Docker daemon  2.048kB
Step 1/4 : FROM mcr.microsoft.com/windows-insider
 ---> 09a59f60f394
Step 2/4 : SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
 ---> Running in 59680f017c12
Removing intermediate container 59680f017c12
 ---> 94bce0226b5e
Step 3/4 : RUN Set-Service -Name spooler -StartupType Automatic
 ---> Running in 2dc61f761ef5
Removing intermediate container 2dc61f761ef5
 ---> c18e54ae08a3
Step 4/4 : RUN Get-Printer
 ---> Running in a843b0293503

Name                           ComputerName    Type         DriverName
----                           ------------    ----         ----------
Microsoft XPS Document Writer                  Local        Microsoft XPS Do...
Microsoft Print to PDF                         Local        Microsoft Print ...
Fax                                            Local        Microsoft Shared...


Removing intermediate container a843b0293503
 ---> 6347e0cdb9e9
Successfully built 6347e0cdb9e9
Successfully tagged print:latest
```
