# OpenSSH

Run Microsoft OpenSSH service in a Windows container.

Why?

You might want to have a test environment to try it out.

- https://github.com/inspec/train/pull/416
- https://github.com/inspec/train/issues/419

## Build the image

```
docker build -t openssh .
```

## Run the image

```
docker run -d -p 2222:22 openssh
```

## Test SSH connection

```
ssh -p 2222 User032@localhost
```

## Known issues

Running `cmd /c ver` has an error, appending quotes:

```
$ ssh -p 2222 User03@localhost cmd /c ver
User03@localhost's password:
'ver"' is not recognized as an internal or external command,
operable program or batch file.
```

Opened issue https://github.com/PowerShell/Win32-OpenSSH/issues/1373

But it can be fixed by using `cmd.exe /c ver` with the exe extension

```
$ ssh -p 2222 User03@$(dm ip 2019-box) cmd.exe /c ver
User03@172.16.208.196's password:

Microsoft Windows [Version 10.0.17763.437]
```

## Dockerfile
- [Dockerfile](https://github.com/StefanScherer/dockerfiles-windows/blob/master/openssh/Dockerfile)
