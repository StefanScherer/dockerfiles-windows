# realpath

Example program how to retrieve the real path of a file or directory that
may be bind mounted into a Windows container.

But the function `GetFinalPathNameByHandle()` doesn't seem to retrieve us
at least the absolute path of the file/directory given.
It just returns with error 53 ERROR_BAD_NETPATH: The network path was not found.

```
$ docker run -v C:$(pwd):C:/code -it realpath cmd

Microsoft Windows [Version 10.0.14393]
(c) 2016 Microsoft Corporation. All rights reserved.

C:\>dir
 Volume in drive C has no label.
 Volume Serial Number is C4ED-1909

 Directory of C:\

05/08/2017  07:51 AM    <SYMLINKD>     code [\\?\ContainerMappedDirectories\F79F703B-1A2E-408F-BA7E-77AB162E2F77]
11/22/2016  03:45 PM             1,894 License.txt
07/16/2016  06:18 AM    <DIR>          PerfLogs
04/10/2017  02:13 PM    <DIR>          Program Files
07/16/2016  06:18 AM    <DIR>          Program Files (x86)
05/08/2017  07:46 AM           119,808 realpath.exe
05/08/2017  07:51 AM    <DIR>          Users
05/08/2017  07:51 AM    <DIR>          Windows
               2 File(s)        121,702 bytes
               6 Dir(s)  21,239,640,064 bytes free

C:\>realpath.exe code
Opening code
Could not get final path (error 53)

C:\>exit
```
