# procmon in a container

Try to run procmon - the Sysinternals Process Monitor - in a container.

## Build the image

```
docker build -t procmon .
```

## Capturing

With `procmon /quiet /minimized /backingfile abc.pml` you can start capturing.

With `procmon /terminate` you can stop capturing.

## Issues

The captured file doesn't look good. It starts with 4,194,304 byte, after
terminating the capture the file is only 976 byte. This happens in 17093 insider builds.
In a 10.14393.2007 windowsservercore image the file is 4,194,304 byte, but also doesn't look good.

```
$ docker run -it procmon cmd

Microsoft Windows [Version 10.0.17093.1000]
(c) 2017 Microsoft Corporation. All rights reserved.

C:\>procmon /quiet /minimized /backingfile abc.pml

C:\>dir
 Volume in drive C has no label.
 Volume Serial Number is 6C54-E4C6

 Directory of C:\

02/14/2018  12:11 PM         4,194,304 abc.pml
02/03/2018  03:10 AM             1,894 License.txt
02/13/2018  01:23 PM         2,164,360 procmon.exe
02/03/2018  03:13 AM    <DIR>          Program Files
02/14/2018  12:11 PM    <DIR>          Program Files (x86)
02/03/2018  03:14 AM    <DIR>          Users
02/14/2018  12:10 PM    <DIR>          Windows
               3 File(s)      6,360,558 bytes
               4 Dir(s)  21,290,831,872 bytes free

C:\>procmon /terminate

C:\>dir
 Volume in drive C has no label.
 Volume Serial Number is 6C54-E4C6

 Directory of C:\

02/14/2018  12:11 PM               976 abc.pml
02/03/2018  03:10 AM             1,894 License.txt
02/13/2018  01:23 PM         2,164,360 procmon.exe
02/03/2018  03:13 AM    <DIR>          Program Files
02/14/2018  12:11 PM    <DIR>          Program Files (x86)
02/03/2018  03:14 AM    <DIR>          Users
02/14/2018  12:10 PM    <DIR>          Windows
               3 File(s)      2,167,230 bytes
               4 Dir(s)  21,296,209,920 bytes free

C:\>type abc.pml
PML_	AABB08234517C:\Windows??????????
?B????
```

## Forums

* https://forum.sysinternals.com/procmon-in-windows-containers_topic32977.html
* https://social.msdn.microsoft.com/Forums/vstudio/en-US/b20be612-95da-4476-8b15-052370b4321e/procmon-freezes-in-windowsservercore?forum=windowscontainers

## Run procmon on container host

See my blog post https://stefanscherer.github.io/find-dependencies-in-windows-containers/

Predefined filter for Process Monitor to look for missing DLL's.

* [depends.PMF](./depends.PMF)
