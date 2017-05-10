# PowerShell and the 50 characters clipboard problem

At the moment the `microsoft/windowsservercore` image has the problem
that pasting a longer text will be cut at 50 characters.

Try it with the following command, copy it to clipboard,

```
Write-Host Paste and execute this command does not loose characters.
```

then start an interactive container

```
docker run -it microsoft/windowsservercore powershell
```

Now paste your clipboard into it (I also can repro it from my Mac pasting it into a Windows container). The command is missing the last two words. Try it again in microsoft/nanoserver and it will work.

A fix could be removing PSReadLine from windowsservercore until it is fixed in PSReadLine module.

```Dockerfile
FROM microsoft/windowsservercore
WORKDIR "Program Files"
RUN rd /S /Q WindowsPowerShell\Modules\PSReadLine
WORKDIR /
```

## See also
- https://github.com/moby/moby/issues/29646
- https://github.com/lzybkr/PSReadLine/issues/460
