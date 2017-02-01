docker tag consul:0.7.3 stefanscherer/consul-windows:0.7.3 || exit /b
docker tag consul:0.7.3 stefanscherer/consul-windows:latest || exit /b
docker push stefanscherer/consul-windows:0.7.3
docker push stefanscherer/consul-windows:latest
