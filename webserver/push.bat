docker tag webserver:0.2.0 stefanscherer/webserver-windows:0.2.0 || exit /b
docker tag webserver:0.2.0 stefanscherer/webserver-windows:latest || exit /b
docker push stefanscherer/webserver-windows:0.2.0
docker push stefanscherer/webserver-windows:latest
