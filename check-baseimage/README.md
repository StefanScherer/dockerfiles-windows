# Check base image for an update

Once you push a Windows image it might get out of date.
Let's hack a small script to check if the current image is out of date
and there is a newer one in MCR, the Microsoft Container Registry.

## Example

```
$ docker build -t stefanscherer/check-baseimage .
Sending build context to Docker daemon  4.608kB
Step 1/3 : FROM mcr.microsoft.com/windows/servercore:ltsc2016
 ---> ea9f7aa13d03
Step 2/3 : COPY check-baseimage.ps1 check-baseimage.ps1
 ---> 719d742e96ec
Step 3/3 : RUN powershell -File check-baseimage.ps1
 ---> Running in 003723fac24c
Base image Update Build Revision 2724, Hub Update Build Revision 3204
C:\check-baseimage.ps1 : Your base image has update revision 2724, but should be
updated to 3204!
At C:\check-baseimage.ps1:15 char:3
+   Write-Error "Your base image has update revision $currUBR, but should be  ...
+   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorExcep
   tion
    + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorExceptio
   n,check-baseimage.ps1

The command 'cmd /S /C powershell -File check-baseimage.ps1' returned a non-zero code: 1
```
