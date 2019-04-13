# NanoServerApiScan

Build a Docker image with the NanoServerApiScan tool. If you developed a 64-bit application, tool, or agent for Windows Server in C/C++, you can use NanoServerApiScan to check if your app will also run on Nano Server. Remember that Nano Server is 64-bit only and won’t run 32-bit binaries.

## Usage

There are two variants to run the scanner.

### Use volume

Bind mount the directory with your Exe files to scan to `C:\scan` into the container.

```
docker run -v "$(pwd):C:\scan" nanoserverapiscan
```

### Use onbuild

If you can't use `-v` for example if you are using a remote Windows Docker engine
you can use the onbuild variant instead.

Create a small Dockerfile with the following line in the directory of your
binaries to scan.

```Dockerfile
FROM nanoserverapiscan:onbuild
```

Then build a Docker image with your binaries and then run the container to
scan all binaries.

```
docker build -t scan .
docker run scan
```

## Build the nanoserverapiscan images

```
docker rm -f nano
docker create --name nano mcr.microsoft.com/windows/nanoserver
rm -rf tmp
mkdir tmp
docker cp nano:Windows/System32/Forwarders tmp
docker build -t win10sdk -f Dockerfile.build .
docker rm -f win10sdk
docker create --name win10sdk win10sdk
mkdir -p tmp/kit/um/x64 tmp/kit/ucrt/x64
docker cp "win10sdk:Program Files (x86)/Windows Kits/10/Lib/10.0.14393.0/um/x64" tmp/kit/um/x64
docker cp "win10sdk:Program Files (x86)/Windows Kits/10/Lib/10.0.14393.0/ucrt/x64" tmp/kit/ucrt/x64

docker build -t nanoserverapiscan .
docker build -t nanoserverapiscan:onbuild onbuild
```

## See also

### Blog post

* https://blogs.technet.microsoft.com/nanoserver/2016/04/27/nanoserverapiscan-exe-updated-for-tp5/

### Nano Server APIs

* https://msdn.microsoft.com/en-us/library/mt588480(v=vs.85).aspx

### Docker image

* https://hub.docker.com/r/stefanscherer/nanoserverapiscan/
