# WinRM

Run Microsoft WinRM service in a Windows container.

Why?

You might want to have an integration test environment to try it out.

- https://github.com/inspec/train/issues/419

## Build the image

```
docker build -t winrm .
```

## Run the image

```
docker run -d -p 55985:5985 winrm
```

## Test SSH connection

Using [masterzen/winrm-cli](https://github.com/masterzen/winrm-cli)

```
winrm -port 55985 -username User03 -password Passw0rd -hostname localhost ipconfig
```

## Dockerfile
- [Dockerfile](https://github.com/StefanScherer/dockerfiles-windows/blob/master/winrm/Dockerfile)
