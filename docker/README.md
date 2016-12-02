# Build Docker Engine for Windows in Docker

To build the Docker Engine for Windows Server 2016 from source with only
with Docker and Git on the host use this setup.

This `Dockerfile.windows` made it into the docker/docker repo with [PR #18348](https://github.com/docker/docker/pull/18348) but is now
updated to fit into the Windows CI.

But the basic idea was to just use Windows Server 2016 and Docker and nothing else on the
host machine  (ok, Git would be nice to clone this dockerfiles-windows repo) to
build the Docker Engine for Windows.

If you want to build Docker Engine on your own then just run `build.bat`.

## Build a pull request

If you are interested in a pull request and want to try it out before
it gets merged, you can run `build.bat` with the pull request number.

To build eg. this PR https://github.com/docker/docker/pull/28964 which switches
to `make.ps1`, run

```cmd
.\build.bat 28964
```

The binaries for Docker Client and Docker Daemon are copied into the `binary` sub directory.

## Test the binaries

Open an administrator PowerShell and run these commands to replace the Docker Client and Daemon. You may make a backup of your current binaries.

```powershell
Stop-Service docker
copy binary\docker.exe "C:\Program Files\docker\docker.exe"
copy binary\dockerd.exe "C:\Program Files\docker\dockerd.exe"
Start-Service docker
```
