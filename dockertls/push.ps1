$version=$(select-string -Path Dockerfile -Pattern "ENV VERSION").ToString().split()[-1]
docker tag dockertls stefanscherer/dockertls-windows:$version
docker tag dockertls stefanscherer/dockertls-windows
docker push stefanscherer/dockertls-windows:$version
docker push stefanscherer/dockertls-windows
