# netapi-helper

All Golang binaries that use the glog logging package have a dependency to the netapi32.dll which is not part of the NanoServer image.
There is an issue https://github.com/golang/go/issues/21867 with some ideas

- fix Golang's dependency to that dll
- fix Golang glog package to avoid calling `user.Current`
- copy the netapi32.dll into the NanoServer image to have a workaround without recompiling anything

This is a base image for my rebase-docker-image tool to build newer images on AppVeyor.
