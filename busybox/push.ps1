docker tag busybox stefanscherer/busybox-windows
docker push stefanscherer/busybox-windows

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/busybox-windows -t stefanscherer/busybox-windows:1709 -b microsoft/nanoserver:1709
