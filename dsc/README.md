# Desired State Configuration - DSC

## Build an image and install software with PowerShell DSC

```
docker build -t dsc .
```

```
$ docker history dsc
IMAGE               CREATED              CREATED BY                                      SIZE                COMMENT
7b58a23478f9        23 seconds ago       cmd /S /C powershell .\test.ps1                 269 MB              
efb8dc939bf5        About a minute ago   cmd /S /C #(nop) COPY file:56bbc9d994e00b0...   41.2 kB             
590c0c2590e4        3 weeks ago          Install update 10.0.14393.1066                  2.47 GB             
<missing>           5 months ago         Apply image 10.0.14393.0                        7.68 GB             
```


More infos can be found at https://github.com/artisticcheese/artisticcheesecontainer/wiki
