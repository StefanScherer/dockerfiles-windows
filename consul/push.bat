docker tag consul:0.7.2 stefanscherer/consul-windows:0.7.2 || exit /b
docker tag consul:0.7.2 stefanscherer/consul-windows:latest || exit /b
docker push stefanscherer/consul-windows:0.7.2
docker push stefanscherer/consul-windows:latest
