# Build Docker Engine for Windows in Docker

To build the Docker Engine for Windows from source with only TP4 and Docker
on the host use this setup.

This `Dockerfile.windows` made it into the docker/docker repo with [PR #18348](https://github.com/docker/docker/pull/18348) but is now
updated to fit into the Windows CI.

But the basic idea was to just use TP4 and Docker and nothing else on the
host machine to build the Docker Engine for Windows.

If you want to build Docker Engine on your own then just run `build.bat`.
