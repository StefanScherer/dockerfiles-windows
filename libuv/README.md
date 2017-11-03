# Test libuv in nanoserver

See https://github.com/libuv/libuv/pull/1611 which fixes a bug introduced in
libuv 1.15.0 using an API that is not available in NanoServer containers.

So I wrote a `Dockerfile` to build and test libuv in nanoserver

```
docker build -t libuv --build-arg branch=v1.14.1 --build-arg org=libuv .  # works
docker build -t libuv --build-arg branch=v1.15.0 --build-arg org=libuv .  # crashes
docker build -t libuv --build-arg branch=bartek-fix-win-nanoserver --build-arg org=janeasystems .
```
