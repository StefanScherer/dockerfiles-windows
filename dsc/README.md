# Desired State Configuration - DSC

## Build dsc base image

```
docker build -t dsc .
```

### Run example

Run an interactive Windows container to test DSC in a clean environment.

```
docker run -it -v "$(pwd):c:\code" dsc powershell
```

Create the mof file for this container node:

```
cd C:\code
.\test.ps1
```

Now run the DSC configuration

```
Start-DscConfiguration . -verbose -wait
```
