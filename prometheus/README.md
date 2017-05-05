# prometheus
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/prometheus-windows.svg)](https://hub.docker.com/r/stefanscherer/prometheus-windows/)


```
$ mkdir -p data
$ docker run -d -p 9090:9090 \
  -v C:$(pwd)/data:C:/prometheus -v C:$(pwd):C:/config 
  prometheus -config.file=/config/prometheus.yml \
  -storage.local.path=/prometheus \
  -web.console.libraries=/etc/prometheus/console_libraries \
  -web.console.templates=/etc/prometheus/consoles
$ open http://$(docker-machine ip windows):9090
```

See the [Getting started](https://prometheus.io/docs/introduction/getting_started/) guide to learn more about Prometheus.
