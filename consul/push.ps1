docker tag consul:0.7.5 stefanscherer/consul-windows:0.7.5 || exit /b
docker tag consul:0.7.5 stefanscherer/consul-windows:latest || exit /b
docker push stefanscherer/consul-windows:0.7.5
docker push stefanscherer/consul-windows:latest
