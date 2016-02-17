# registry

Run your own Docker Registry in a Windows Docker container.

## Open firewall

```
if (!(Get-NetFirewallRule | where {$_.Name -eq "TCP5000"})) {
    New-NetFirewallRule -Name "TCP5000" -DisplayName "HTTP on TCP/5000" -Protocol tcp -LocalPort 5000 -Action Allow -Enabled True
}
```

Doesn't work?

## Create a folder on your host

```
mkdir C:\registry
```

## Edit your Docker Engine config filesystem

```
notepad C:\ProgramData\docker\runDockerDaemon.cmd
```

Add your Registry to the start command:

```
docker daemon -D -b "Virtual Switch" -H 0.0.0.0:2375 --insecure-registry 172.16.0.2:5000
```

## Restart Docker Engine

```
restart-service docker
```

## Run the Registry

```
docker run -p 5000:5000 --name registry -v C:\registry:C:\registry registry
```

## Get the IP of the Registry container

```
docker exec -ti registry ipconfig
```

Should be 172.16.0.2

## Tag a Docker image

```
docker tag registry:2.3.0 172.16.0.2:5000/registry:2.3.0
```

## Push a Docker image

```
docker push 172.16.0.2.:5000/registry:2.3.0
```

But the registry panics:

```
time="2016-02-17T13:41:11+01:00" level=warning msg="No HTTP secret provided - generated random secret. This may cause problems with uploads if multiple registries are behind a load-balancer. To provide a shared secret, fill in http.secret in the configuration file or set the REGISTRY_HTTP_SECRET environment variable." go.version=go1.5.3 instance.id=b8e36a91-9e1b-46c8-b8fa-38e127dba265 version="v2.3.0+unknown"
time="2016-02-17T13:41:11+01:00" level=info msg="redis not configured" go.version=go1.5.3 instance.id=b8e36a91-9e1b-46c8-b8fa-38e127dba265 version="v2.3.0+unknown"
time="2016-02-17T13:41:11+01:00" level=info msg="Starting upload purge in 2m0s" go.version=go1.5.3 instance.id=b8e36a91-9e1b-46c8-b8fa-38e127dba265 version="v2.3.0+unknown"
time="2016-02-17T13:41:11+01:00" level=info msg="using inmemory blob descriptor cache" go.version=go1.5.3 instance.id=b8e36a91-9e1b-46c8-b8fa-38e127dba265 version="v2.3.0+unknown"
time="2016-02-17T13:41:11+01:00" level=info msg="listening on [::]:5000" go.version=go1.5.3 instance.id=b8e36a91-9e1b-46c8-b8fa-38e127dba265 version="v2.3.0+unknown"
time="2016-02-17T13:43:11+01:00" level=info msg="PurgeUploads starting: olderThan=2016-02-10 13:43:11.813054 +0100 CET, actuallyDelete=true"
time="2016-02-17T13:43:11+01:00" level=info msg="Purge uploads finished.  Num deleted=0, num errors=1"
time="2016-02-17T13:43:11+01:00" level=info msg="Starting upload purge in 24h0m0s" go.version=go1.5.3 instance.id=b8e36a91-9e1b-46c8-b8fa-38e127dba265 version="v2.3.0+unknown"
172.16.0.1 - - [17/Feb/2016:13:46:40 +0100] "GET / HTTP/1.1" 200 0 "" "curl/7.46.0"
time="2016-02-17T14:45:17+01:00" level=warning msg="No HTTP secret provided - generated random secret. This may cause problems with uploads if multiple registries are behind a load-balancer. To provide a shared secret, fill in http.secret in the configuration file or set the REGISTRY_HTTP_SECRET environment variable." go.version=go1.5.3 instance.id=d88d62ba-8e81-49a1-ba87-ecbef75ace98 version="v2.3.0+unknown"
time="2016-02-17T14:45:17+01:00" level=info msg="Starting upload purge in 47m0s" go.version=go1.5.3 instance.id=d88d62ba-8e81-49a1-ba87-ecbef75ace98 version="v2.3.0+unknown"
time="2016-02-17T14:45:17+01:00" level=info msg="redis not configured" go.version=go1.5.3 instance.id=d88d62ba-8e81-49a1-ba87-ecbef75ace98 version="v2.3.0+unknown"
time="2016-02-17T14:45:17+01:00" level=info msg="using inmemory blob descriptor cache" go.version=go1.5.3 instance.id=d88d62ba-8e81-49a1-ba87-ecbef75ace98 version="v2.3.0+unknown"
time="2016-02-17T14:45:17+01:00" level=info msg="listening on [::]:5000" go.version=go1.5.3 instance.id=d88d62ba-8e81-49a1-ba87-ecbef75ace98 version="v2.3.0+unknown"
time="2016-02-17T14:46:26+01:00" level=info msg="response completed" go.version=go1.5.3 http.request.host="172.16.0.2:5000" http.request.id=001a7a02-5f57-4bc9-87e9-a2dca48814e9 http.request.method=GET http.request.remoteaddr="172.16.0.1:50603" http.request.uri="/v2/" http.request.useragent="docker/1.11.0-dev go/go1.5.3 git-commit/2a9e6ac os/windows arch/amd64" http.response.contenttype="application/json; charset=utf-8" http.response.duration=14.0554ms http.response.status=200 http.response.written=2 instance.id=d88d62ba-8e81-49a1-ba87-ecbef75ace98 version="v2.3.0+unknown"
172.16.0.1 - - [17/Feb/2016:14:46:26 +0100] "GET /v2/ HTTP/1.1" 200 2 "" "docker/1.11.0-dev go/go1.5.3 git-commit/2a9e6ac os/windows arch/amd64"
time="2016-02-17T14:46:26+01:00" level=panic msg="runtime error: slice bounds out of range"
time="2016-02-17T14:46:26+01:00" level=panic msg="runtime error: slice bounds out of range"
2016/02/17 14:46:26 http: panic serving 172.16.0.1:50604: &{0xc0820c0100 map[] 2016-02-17 14:46:26.204816 +0100 CET panic runtime error: slice bounds out of range}
goroutine 23 [running]:
net/http.(*conn).serve.func1(0xc0822be4d0, 0x1f39090, 0xc0820ca560)
        c:/go/src/net/http/server.go:1287 +0xbc
github.com/Sirupsen/logrus.(*Entry).log(0xc0825f3300, 0x0, 0xc082529980, 0x28)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/Sirupsen/logrus/entry.go:103 +0x602
github.com/Sirupsen/logrus.(*Entry).Panic(0xc0825f3300, 0xc08264de88, 0x1, 0x1)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/Sirupsen/logrus/entry.go:148 +0x83
github.com/Sirupsen/logrus.(*Logger).Panic(0xc0820c0100, 0xc08264de88, 0x1, 0x1)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/Sirupsen/logrus/logger.go:155 +0xf4
github.com/Sirupsen/logrus.Panic(0xc08264de88, 0x1, 0x1)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/Sirupsen/logrus/exported.go:102 +0x48
github.com/docker/distribution/registry.panicHandler.func1.1()
        C:/Go/src/github.com/docker/distribution/registry/registry.go:287 +0x1a8
syscall.Readlink(0xc082113e30, 0x9, 0xc08247aa80, 0x80, 0x80, 0x0, 0x0, 0x0)
        c:/go/src/syscall/syscall_windows.go:1024 +0x4e9
os.Readlink(0xc082113e30, 0x9, 0x0, 0x0, 0x0, 0x0)
        c:/go/src/os/file_posix.go:21 +0xc4
os.Stat(0xc082113e30, 0x9, 0x0, 0x0, 0x0, 0x0)
        c:/go/src/os/stat_windows.go:62 +0x116
os.MkdirAll(0xc082113e30, 0x9, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:21 +0x56
os.MkdirAll(0xc082113e30, 0x10, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc082113e30, 0x19, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc082113e30, 0x1c, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc082113e30, 0x29, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc082113e30, 0x32, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc082113e30, 0x3b, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc082113e30, 0x60, 0xc0000001ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
github.com/docker/distribution/registry/storage/driver/filesystem.(*driver).WriteStream(0xc08237f350, 0x1b55ab0, 0xc082113c70, 0xc082113c00, 0x61, 0x0, 0x1b5b688, 0xc082529650, 0x0, 0x0, ...)
        C:/Go/src/github.com/docker/distribution/registry/storage/driver/filesystem/driver.go:138 +0xd9
github.com/docker/distribution/registry/storage/driver/filesystem.(*driver).PutContent(0xc08237f350, 0x1b55ab0, 0xc082113c70, 0xc082113c00, 0x61, 0xc0824f3c40, 0x14, 0x20, 0x0, 0x0)
        C:/Go/src/github.com/docker/distribution/registry/storage/driver/filesystem/driver.go:97 +0x140
github.com/docker/distribution/registry/storage/driver/base.(*Base).PutContent(0xc08237f360, 0x1b55ab0, 0xc082113c70, 0xc082113c00, 0x61, 0xc0824f3c40, 0x14, 0x20, 0x0, 0x0)
        C:/Go/src/github.com/docker/distribution/registry/storage/driver/base/base.go:102 +0x3ef
github.com/docker/distribution/registry/storage.(*linkedBlobStore).Create(0xc082113a40, 0x1b5b4d8, 0xc082113960, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
        C:/Go/src/github.com/docker/distribution/registry/storage/linkedblobstore.go:174 +0x9d4
github.com/docker/distribution/notifications.(*blobServiceListener).Create(0xc0824f3b00, 0x1b5b4d8, 0xc082113960, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
        C:/Go/src/github.com/docker/distribution/notifications/listener.go:165 +0xd0
github.com/docker/distribution/registry/handlers.(*blobUploadHandler).StartBlobUpload(0xc082113960, 0x1f39558, 0xc082253950, 0xc082400000)
        C:/Go/src/github.com/docker/distribution/registry/handlers/blobupload.go:136 +0x2b2
github.com/docker/distribution/registry/handlers.(*blobUploadHandler).StartBlobUpload-fm(0x1f39558, 0xc082253950, 0xc082400000)
        C:/Go/src/github.com/docker/distribution/registry/handlers/blobupload.go:33 +0x45
net/http.HandlerFunc.ServeHTTP(0xc0820b23b0, 0x1f39558, 0xc082253950, 0xc082400000)
        c:/go/src/net/http/server.go:1422 +0x41
github.com/gorilla/handlers.MethodHandler.ServeHTTP(0xc082529470, 0x1f39558, 0xc082253950, 0xc082400000)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/gorilla/handlers/handlers.go:35 +0xb9
github.com/docker/distribution/registry/handlers.(*App).dispatcher.func1(0x1f39558, 0xc082253950, 0xc082400000)
        C:/Go/src/github.com/docker/distribution/registry/handlers/app.go:641 +0x254d
net/http.HandlerFunc.ServeHTTP(0xc082380520, 0x1f39558, 0xc082253950, 0xc082400000)
        c:/go/src/net/http/server.go:1422 +0x41
github.com/gorilla/mux.(*Router).ServeHTTP(0xc082252b40, 0x1f39558, 0xc082253950, 0xc082400000)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/gorilla/mux/mux.go:98 +0x2a5
github.com/docker/distribution/registry/handlers.(*App).ServeHTTP(0xc082316240, 0x1f39558, 0xc082253950, 0xc082400000)
        C:/Go/src/github.com/docker/distribution/registry/handlers/app.go:561 +0x315
github.com/docker/distribution/registry.alive.func1(0x1f39438, 0xc0824417d0, 0xc082400000)
        C:/Go/src/github.com/docker/distribution/registry/registry.go:307 +0x138
net/http.HandlerFunc.ServeHTTP(0xc0820a7440, 0x1f39438, 0xc0824417d0, 0xc082400000)
        c:/go/src/net/http/server.go:1422 +0x41
github.com/docker/distribution/health.Handler.func1(0x1f39438, 0xc0824417d0, 0xc082400000)
        C:/Go/src/github.com/docker/distribution/health/health.go:271 +0x1a1
net/http.HandlerFunc.ServeHTTP(0xc082009440, 0x1f39438, 0xc0824417d0, 0xc082400000)
        c:/go/src/net/http/server.go:1422 +0x41
github.com/docker/distribution/registry.panicHandler.func1(0x1f39438, 0xc0824417d0, 0xc082400000)
        C:/Go/src/github.com/docker/distribution/registry/registry.go:290 +0x7e
net/http.HandlerFunc.ServeHTTP(0xc082009460, 0x1f39438, 0xc0824417d0, 0xc082400000)
        c:/go/src/net/http/server.go:1422 +0x41
github.com/gorilla/handlers.combinedLoggingHandler.ServeHTTP(0x1b542e8, 0xc082020010, 0x1f30168, 0xc082009460, 0x1f39298, 0xc0822be580, 0xc082400000)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/gorilla/handlers/handlers.go:75 +0x126
github.com/gorilla/handlers.(*combinedLoggingHandler).ServeHTTP(0xc082009480, 0x1f39298, 0xc0822be580, 0xc082400000)
        <autogenerated>:13 +0xbb
net/http.serverHandler.ServeHTTP(0xc0820102a0, 0x1f39298, 0xc0822be580, 0xc082400000)
        c:/go/src/net/http/server.go:1862 +0x1a5
net/http.(*conn).serve(0xc0822be4d0)
        c:/go/src/net/http/server.go:1361 +0xbf5
created by net/http.(*Server).Serve
        c:/go/src/net/http/server.go:1910 +0x3fd
2016/02/17 14:46:26 http: panic serving 172.16.0.1:50607: &{0xc0820c0100 map[] 2016-02-17 14:46:26.2118131 +0100 CET panic runtime error: slice bounds out of range}
goroutine 9 [running]:
net/http.(*conn).serve.func1(0xc0822be2c0, 0x1f39090, 0xc0820ca090)
        c:/go/src/net/http/server.go:1287 +0xbc
github.com/Sirupsen/logrus.(*Entry).log(0xc0820c0d40, 0x0, 0xc0821efe60, 0x28)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/Sirupsen/logrus/entry.go:103 +0x602
github.com/Sirupsen/logrus.(*Entry).Panic(0xc0820c0d40, 0xc08256de78, 0x1, 0x1)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/Sirupsen/logrus/entry.go:148 +0x83
github.com/Sirupsen/logrus.(*Logger).Panic(0xc0820c0100, 0xc08256de78, 0x1, 0x1)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/Sirupsen/logrus/logger.go:155 +0xf4
github.com/Sirupsen/logrus.Panic(0xc08256de78, 0x1, 0x1)
        C:/go/src/github.com/docker/distribution/Godeps/_workspace/src/github.com/Sirupsen/logrus/exported.go:102 +0x48
github.com/docker/distribution/registry.panicHandler.func1.1()
        C:/Go/src/github.com/docker/distribution/registry/registry.go:287 +0x1a8
syscall.Readlink(0xc08222c770, 0x9, 0xc08247bc00, 0x80, 0x80, 0x0, 0x0, 0x0)
        c:/go/src/syscall/syscall_windows.go:1024 +0x4e9
os.Readlink(0xc08222c770, 0x9, 0x0, 0x0, 0x0, 0x0)
        c:/go/src/os/file_posix.go:21 +0xc4
os.Stat(0xc08222c770, 0x9, 0x0, 0x0, 0x0, 0x0)
        c:/go/src/os/stat_windows.go:62 +0x116
os.MkdirAll(0xc08222c770, 0x9, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:21 +0x56
os.MkdirAll(0xc08222c770, 0x10, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc08222c770, 0x19, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc08222c770, 0x1c, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc08222c770, 0x29, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc08222c770, 0x32, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc08222c770, 0x3b, 0x1ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
os.MkdirAll(0xc08222c770, 0x60, 0xc0000001ff, 0x0, 0x0)
        c:/go/src/os/path.go:42 +0x2e2
github.com/docker/distribution/registry/storage/driver/filesystem.(*driver).WriteStream(0xc08237f350, 0x1b55ab0, 0xc08222c5b0, 0xc08222c540, 0x61, 0x0, 0x1b5b688, 0xc0821efb30, 0x0, 0x0, ...)
        C:/Go/src/github.com/docker/distribution/registry/storage/driver/filesystem/driver.go:138 +0xd9
github.com/docker/distribution/registry/storage/driver/filesystem.(*driver).PutContent(0xc08237f350, 0x1b55ab0, 0xc08222c5b0, 0xc08222c540, 0x61, 0xc0822a8940, 0x14, 0x20, 0x0, 0x0)
        C:/Go/src/github.com/docker/distribution/registry/storage/driver/filesystem/driver.go:97 +0x140
github.com/docker/distribution/registry/storage/driver/base.(*Base).PutContent(0xc08237f360, 0x1b55ab0, 0xc08222c5b0, 0xc08222c540, 0x61, 0xc0822a8940, 0x14, 0x20, 0x0, 0x0)
        C:/Go/src/github.com/docker/distribution/registry/storage/driver/base/base.go:102 +0x3ef
github.com/docker/distribution/registry/storage.(*linkedBlobStore).Create(0xc08222c380, 0x1b5b4d8, 0xc08222c2a0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
        C:/Go/src/github.com/docker/distribution/registry/storage/linkedblobstore.go:174 +0x9d4
github.com/docker/distribution/notifications.(*blobServiceListener).Create(0xc0822a8800, 0x1b5b4d8, 0xc08222c2a0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
        C:/Go/src/github.com/docker/distribution/notifications/listener.go:165 +0xd0
github.com/docker/distribution/registry/handlers.(*blobUploadHandler).StartBlobUpload(0xc08222c2a0, 0x1f39558, 0xc0825ee730, 0xc082629180)
```
