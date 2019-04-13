# golang/go issue 21867

Investigations for issue https://github.com/golang/go/issues/21867

Some Golang binaries are not able to run in mcr.microsoft.com/windows/nanoserver-insider images as there is an indirect dependency to the missing netapi32.dll.

```
$ docker build -t currentuser .
$ docker run currentuser
Hello
panic: Failed to load netapi32.dll: The specified module could not be found.

goroutine 1 [running]:
syscall.(*LazyProc).mustFind(0xc04203b8c0)
	C:/go/src/syscall/dll_windows.go:280 +0x5f
syscall.(*LazyProc).Addr(0xc04203b8c0, 0x1)
	C:/go/src/syscall/dll_windows.go:287 +0x32
syscall.NetGetJoinInformation(0x0, 0xc04205fca8, 0xc04205fca4, 0x0, 0x0)
	C:/go/src/syscall/zsyscall_windows.go:1784 +0x38
os/user.isDomainJoined(0x4623e4, 0x29f8600, 0x0)
	C:/go/src/os/user/lookup_windows.go:21 +0x5a
os/user.lookupFullName(0xc0420440f0, 0xc, 0xc0420440e0, 0xd, 0xc0420421c0, 0x1a, 0xd, 0xc0420421c0, 0x1a, 0x0)
	C:/go/src/os/user/lookup_windows.go:58 +0x2d
os/user.newUser(0xc042068050, 0xc0420440c0, 0xc, 0xc042042180, 0x16, 0x53f1f0, 0x0, 0x0)
	C:/go/src/os/user/lookup_windows.go:88 +0x178
os/user.current(0x0, 0x0, 0x0)
	C:/go/src/os/user/lookup_windows.go:124 +0x18c
os/user.Current.func1()
	C:/go/src/os/user/lookup.go:11 +0x2d
sync.(*Once).Do(0x544660, 0x4d36e8)
	C:/go/src/sync/once.go:44 +0xc5
os/user.Current(0xc04205ff20, 0x1, 0x1)
	C:/go/src/os/user/lookup.go:11 +0x44
main.main()
	C:/gopath/currentuser.go:10 +0x85
```

## Workaround

There is a workaround to copy the missing netapi32.dll into the nanoserver-insider image.

```Dockerfile
FROM mcr.microsoft.com/windows/servercore-insider as core
FROM mcr.microsoft.com/windows/nanoserver-insider
COPY --from=core /windows/system32/netapi32.dll
```

It is only needed to satisfy the DLL entry points, even if these functions are not called at runtime.

```
$ docker build -t currentuserfix -f Dockerfile.works .
$ docker run currentuserfix
Hello
Current user &{S-1-5-93-2-2 S-1-5-93-2-2 User Manager\ContainerUser ContainerUser C:\Users\ContainerUser}
```
