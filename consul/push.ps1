$version=$(select-string -Path Dockerfile -Pattern "ENV CONSUL_VERSION").ToString().split()[-1]
docker tag consul stefanscherer/consul-windows:$version
docker tag consul stefanscherer/consul-windows:latest
docker push stefanscherer/consul-windows:$version
docker push stefanscherer/consul-windows:latest
