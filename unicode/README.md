# Unicode

Test Unicode capabilities in Windows containers.

Test an UTF-16 file with content `Михаил`:

## Mac with Windows Docker Machine

```
$ docker run -v C:$(pwd):C:/unicode -w C:/unicode microsoft/nanoserver cmd /c type utf16le.txt
Михаил
```

## Windows

```
PS C:\Users\stefan\code\dockerfiles-windows\unicode> docker run -v "$(pwd):c:/unicode" -w c:/unicode microsoft/nanoserver cmd /c type utf16le.txt
Михаил
```
