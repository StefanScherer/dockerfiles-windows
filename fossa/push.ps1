$version=$(select-string -Path Dockerfile -Pattern "ENV FOSSA_VERSION").ToString().split()[-1]
docker tag fossa stefanscherer/fossa-windows:$version
docker push stefanscherer/fossa-windows:$version
docker tag fossa stefanscherer/fossa-windows:latest
docker push stefanscherer/fossa-windows:latest
