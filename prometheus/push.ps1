$version=$(select-string -Path Dockerfile -Pattern "ENV PROMETHEUS_VERSION").ToString().split()[-1]
docker tag prometheus stefanscherer/prometheus-windows:$version
docker tag prometheus stefanscherer/prometheus-windows:latest
docker push stefanscherer/prometheus-windows:$version
docker push stefanscherer/prometheus-windows:latest
