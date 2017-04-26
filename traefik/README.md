![](https://traefik.io/traefik.logo.svg)
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/traefik-windows.svg)](https://hub.docker.com/r/stefanscherer/traefik-windows/)

[Træfɪk](https://github.com/containous/traefik) is a modern HTTP reverse proxy and load balancer made to deploy microservices with ease. It supports several backends ([Docker :whale:](https://www.docker.com/), [Swarm :whale::whale:](https://github.com/docker/swarm), [Mesos/Marathon](https://mesosphere.github.io/marathon/), [Consul](https://www.consul.io/), [Etcd](https://coreos.com/etcd/), [Zookeeper](https://zookeeper.apache.org), [BoltDB](https://github.com/boltdb/bolt), Rest API, file...) to manage its configuration automatically and dynamically.

## Example usage

Grab a [sample configuration file](https://raw.githubusercontent.com/containous/traefik/master/traefik.sample.toml) and rename it to `traefik.toml`. Enable `docker` provider and web UI:

```toml
################################################################
# Web configuration backend
################################################################
[web]
address = ":8080"
################################################################
# Docker configuration backend
################################################################
[docker]
domain = "docker.local"
watch = true
# increase docker api version to 1.24 with swarm-mode :-)
swarmmode = true
```

Start Træfɪk:

```bash
docker run -it -v C:$(pwd):C:/etc/traefik -v C:/Users/vagrant/.docker:C:/etc/ssl -p 8080:8080 -p 80:80 traefik --docker.endpoint=tcp://172.31.80.1:2375
```

Start a backend server, named `test`:

```bash
docker run -d --name test stefanscherer/whoami-windows
```

And finally, you can access to your `whoami` server throught Træfɪk, on the domain name `{containerName}.{configuredDomain}`:

```bash
curl --header 'Host: test.docker.local' 'http://localhost:80/'
Hostname: 117c5530934d
IP: 127.0.0.1
IP: ::1
IP: 172.17.0.3
IP: fe80::42:acff:fe11:3
GET / HTTP/1.1
Host: 172.17.0.3:80
User-Agent: curl/7.35.0
Accept: */*
Accept-Encoding: gzip
X-Forwarded-For: 172.17.0.1
X-Forwarded-Host: 172.17.0.3:80
X-Forwarded-Proto: http
X-Forwarded-Server: f2e05c433120

```

The web UI [http://localhost:8080](http://localhost:8080) will give you an overview of the frontends/backends and also a health dashboard.

![Web UI Providers](https://traefik.io/web.frontend.png)

## Documentation

You can find the complete documentation [here](https://docs.traefik.io).

## Use with Let's Encrypt

Edit the config files:
* Change the `email` to your email address
* Change `yourdomain.com` in both `traefik.toml` and `docker-compose.yml` to your registered domain name.

For example in Azure add a inbound rule for port 443 to your Windows VM.

Put the public IP address of your Azure VM to your `A` record of the DNS settings for your registered domain.

Put sub domains as `CNAME` as well, eg. `whoami`.

Add a firewall exception for the ports exposed by your containers.
You need eg. port 8000 for the whoami containers so that traefik can talk to all the whoami containers.

Run `docker-compose up` and the `acme.json` file will be created and stored on your Docker host to keep the certificates. As there is a rate limit of 20 requests per week you should store this file on your host to persist it.

Now try curling the whoami

```
curl https://whoami.yourdomain.com
```

You should see two different Id's if you repeat the curl command.

Now scale the service

```
docker-compose scale whoami1=10
```

And run curl again several times. Now more containers will respond.
