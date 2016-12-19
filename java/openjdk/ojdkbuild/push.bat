docker tag openjdk:8-windowsservercore stefanscherer/openjdk-windows:8-windowsservercore
docker tag openjdk:8-windowsservercore stefanscherer/openjdk-windows:8u111-windowsservercore
docker tag openjdk:8-nanoserver stefanscherer/openjdk-windows:8-nanoserver
docker tag openjdk:8-nanoserver stefanscherer/openjdk-windows:8u111-nanoserver

docker push stefanscherer/openjdk-windows:8-windowsservercore
docker push stefanscherer/openjdk-windows:8u111-windowsservercore
docker push stefanscherer/openjdk-windows:8-nanoserver
docker push stefanscherer/openjdk-windows:8u111-nanoserver
