$version=$(select-string -Path Dockerfile -Pattern "ENV POWERCLI_VERSION").ToString().split()[-1]
docker tag powercli stefanscherer/powercli:$version
docker push stefanscherer/powercli:$version
docker tag powercli stefanscherer/powercli:latest
docker push stefanscherer/powercli:latest
