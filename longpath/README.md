# longpath

Test new introduced `tar.exe` in insider builds if it is capable work with long paths.

PowerShell (still) cannot handle more than 260 characters. Therefore `Expand-Archive` fails with ZIP files containing deep nested folders (Hello Node.js node_modules tree).

```
$ docker build -t longpath .
Sending build context to Docker daemon  15.87kB
Step 1/6 : FROM mcr.microsoft.com/windows/servercore-insider
 ---> edfc78327941
Step 2/6 : SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
 ---> Using cache
 ---> 329c9ef7b0c5
Step 3/6 : COPY .  .
 ---> 1d21e7605965
Step 4/6 : RUN mkdir C:\target
 ---> Running in 1fe167ded3ca


    Directory: C:\


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----         2/3/2018   3:55 AM                target


 ---> c75e38ccb910
Step 5/6 : RUN tar xzf C:\longpath.zip -C C:\target
 ---> Running in 54e836548713
 ---> 73e551396e32
Step 6/6 : RUN tar czf C:\test.tar.gz target ;     $output = $(tar tzvf test.tar.gz) ;     if (!($output -match 'subfolders-7\/README.md')) { Write-Error 'Long pathes do not work with tar!' } else { Write-Output 'Long pathes work with tar, yes!!' }
 ---> Running in d11ee1edd669
Long pathes work with tar, yes!!
 ---> ea7be8c1fb48
Removing intermediate container 1fe167ded3ca
Removing intermediate container 54e836548713
Removing intermediate container d11ee1edd669
Successfully built ea7be8c1fb48
Successfully tagged longpath:latest
```
