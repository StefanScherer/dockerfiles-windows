I tried a little with and I wasn’t able to use ContainerUser for a service. I also couldn’t use `USER ContainerUser` in a Dockerfile with Server 2016 LTS, only beginning with Server 2016 Version 1709.

The `USER` instruction in Dockerfile does not work with user accounts with passwords.
Therefore the ContainerAdministrator and ContainerUser do not have a password set.

But I was able to create an user account and use it for a Windows service. I’m using nssm here with a Node.js sample application that is packaged into an MSI file.

Dockerfile:

```Dockerfile
FROM mcr.microsoft.com/windows/servercore:ltsc2019
RUN net user John B@dP@ssw0rd /ADD
COPY . /
RUN msiexec /quiet /i sample.msi ACCOUNT=%COMPUTERNAME%\John PASSWORD=B@dP@ssw0rd
```

Now when I build and run the container:

```
docker build -t service .
docker run -it service powershell
```

I can see the service processes running as user John:

```
PS C:\> .\ps.ps1

ProcessName   Id Owner
-----------   -- -----
CExecSvc    1028 SYSTEM
cmd         3540 ContainerAdministrator
conhost     2248 John
csrss       1040 SYSTEM
Idle           0
lsass       3908 SYSTEM
node        2780 John
node        3880 John
node        3924 John
nssm        2316 John
powershell   764 ContainerAdministrator
services    1628 SYSTEM
smss        3944 SYSTEM
svchost       32 SYSTEM
svchost      172 NETWORK SERVICE
svchost      760 SYSTEM
svchost     1672 LOCAL SERVICE
svchost     3044 NETWORK SERVICE
svchost     3396 SYSTEM
svchost     3532 LOCAL SERVICE
svchost     3652 NETWORK SERVICE
svchost     4072 LOCAL SERVICE
System         4
wininit     2376 SYSTEM
WmiPrvSE    1536 NETWORK SERVICE
```

The MSI package also sets the LogonAsService privilege for that user account. 
