# golang netapi32.dll helper image

If you want to run a Golang binary in a NanoServer container 1709 or newer you might run into trouble
with a missing `netapi32.dll` DLL.

The work in progress to fix this in a future version of Golang can be found at https://github.com/golang/go/issues/21867

As a workaround use this image which has a copy of the DLL from the Server Core base image.

