# prometheus
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/prometheus-windows.svg)](https://hub.docker.com/r/stefanscherer/prometheus-windows/)

# PowerShell

The command line options with a dot need to be quoted in PowerShell:

```powershell
mkdir C:\prom
copy prometheus.yml C:\prom\prometheus.yml
docker container run -d -p 9090:9090 `
  -v "C:\prom\data:C:\prometheus" -v "C:\prom:C:\config" `
  stefanscherer/prometheus-windows '-config.file=/config/prom.yml' `
  '-storage.local.path=/prometheus' `
  '-web.console.libraries=/etc/prometheus/console_libraries' `
  '-web.console.templates=/etc/prometheus/consoles'
```

# bash

From my Mac:

```bash
$ mkdir -p data
$ docker run -d -p 9090:9090 \
  -v C:$(pwd)/data:C:/prometheus -v C:$(pwd):C:/config \
  stefanscherer/prometheus-windows -config.file=/config/prometheus.yml \
  -storage.local.path=/prometheus \
  -web.console.libraries=/etc/prometheus/console_libraries \
  -web.console.templates=/etc/prometheus/consoles
$ open http://$(docker-machine ip windows):9090
```

See the [Getting started](https://prometheus.io/docs/introduction/getting_started/) guide to learn more about Prometheus.

See the script [start-prometheus.ps1](https://github.com/StefanScherer/docker-windows-box/blob/master/scripts/prometheus/start-prometheus.ps1) and [prom.yml](https://github.com/StefanScherer/docker-windows-box/blob/master/scripts/prometheus/prom.yml) to activate the Docker Metrics API and run Prometheus collecting it.
