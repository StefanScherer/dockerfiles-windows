docker tag consul:0.7.4 stefanscherer/consul-windows:0.7.4 || exit /b
docker tag consul:0.7.4 stefanscherer/consul-windows:latest || exit /b
docker push stefanscherer/consul-windows:0.7.4
docker push stefanscherer/consul-windows:latest
