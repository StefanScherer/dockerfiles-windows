# Understanding quotes

You have to use `\"` to have a double quote `"` in your `RUN` command.
This seems odd coming from Linux, but this is how it works on Windows.
Try the following command in your start menu: press Windows key, then paste the following line and execute the command.

```
powershell -Command $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\" ; Sleep 5
```

You will see a PowerShell terminal with the output `'hello "world"'`.

That's why you have to write it the same way in your `Dockerfile`

```Dockerfile
RUN powershell -Command $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"
```

or with a good practice using the `SHELL` command

```Dockerfile
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"
```

It is still not a PowerShell script, but a `powershell.exe -Command` call where you have to escape quotes.

## Output of `docker build`

```
$ docker build --no-cache -t test3 .
Sending build context to Docker daemon 2.048 kB
Step 1/5 : FROM mcr.microsoft.com/windows/servercore:ltsc2016
 ---> 93a9c37b36d0
Step 2/5 : RUN powershell -Command $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"
 ---> Running in 8a5ea6ced75c
'hello "world"'
 ---> 38643ef325f1
Removing intermediate container 8a5ea6ced75c
Step 3/5 : SHELL powershell -Command $ErrorActionPreference = 'Stop';
 ---> Running in 99bfcc757265
 ---> b64caffaed3e
Removing intermediate container 99bfcc757265
Step 4/5 : RUN $a = \"world\" ; Write-Host \"hello $a\"
 ---> Running in ecf1c1c5a429
hello world
 ---> eca9afca260b
Removing intermediate container ecf1c1c5a429
Step 5/5 : RUN $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"
 ---> Running in 3ff86495557a
'hello "world"'
 ---> b693107bf29e
Removing intermediate container 3ff86495557a
Successfully built b693107bf29e
```
