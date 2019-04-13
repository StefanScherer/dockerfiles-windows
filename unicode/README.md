# Unicode

Test Unicode capabilities in Windows containers.

Test an UTF-16 file with content `Михаил`:

## Mac with Windows Docker Machine

```
$ docker run -v C:$(pwd):C:/unicode -w C:/unicode mcr.microsoft.com/windows/nanoserver cmd /c type utf16le.txt
Михаил
```

## Windows

```
PS C:\Users\stefan\code\dockerfiles-windows\unicode> docker run -v "$(pwd):c:/unicode" -w c:/unicode mcr.microsoft.com/windows/nanoserver cmd /c type utf16le.txt
Михаил
```

## Interactive

```
$ docker run -it -v C:$(pwd):C:/unicode -w C:/unicode mcr.microsoft.com/windows/nanoserver powershell

Windows PowerShell
Copyright (C) 2016 Microsoft Corporation. All rights reserved.

PS C:\unicode> cat .\utf16le.txt
??????
PS C:\unicode> cat .\utf16be.txt
??????
PS C:\unicode> cat .\utf8.txt
??????
PS C:\unicode>
```

## Test

```
PS C:\Users\stefan\code\dockerfiles-windows\unicode> .\test.ps1
Test 1: unicode output
Михаил
Test 2: unicode output with interactive mode
Михаил
Test 3: unicode output with interactive and terminal mode

??????
PS C:\Users\stefan\code\dockerfiles-windows\unicode>
```
