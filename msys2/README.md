# MSYS2

A small Docker image to investigate https://github.com/msys2/MSYS2-packages/issues/1490

```
docker build -t msys2 .
```

Run it 

```
docker run msys2 C:/msys64/usr/bin/bash.exe --help
```

Reproduce the "no output" problem with `-it` flag

```
docker run -it msys2 C:/msys64/usr/bin/bash.exe --help
```
