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
Start-DSCConfiguration . -verbose -wait
```

## Is it useful inside containers?

Pushing the dsc base image to Docker hub shows that you need about 290 MByte to have DSC installed.

```
$ docker push stefanscherer/dsc
The push refers to a repository [docker.io/stefanscherer/dsc]
bc61b38bd60a: Pushing 247.3 MB/293.6 MB
b9454c3094c6: Skipped foreign layer 
3fd27ecef6a3: Skipped foreign layer 
```
