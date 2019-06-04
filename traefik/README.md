![](https://traefik.io/traefik.logo.svg)
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/traefik-windows.svg)](https://hub.docker.com/r/stefanscherer/traefik-windows/)

[Træfɪk](https://github.com/containous/traefik) is a modern HTTP reverse proxy and load balancer made to deploy microservices with ease. It supports several backends ([Docker :whale:](https://www.docker.com/), [Swarm :whale::whale:](https://github.com/docker/swarm), [Mesos/Marathon](https://mesosphere.github.io/marathon/), [Consul](https://www.consul.io/), [Etcd](https://coreos.com/etcd/), [Zookeeper](https://zookeeper.apache.org), [BoltDB](https://github.com/boltdb/bolt), Rest API, file...) to manage its configuration automatically and dynamically.

## Example usage

Start Træfɪk on a Windows Server 2019 or Windows 10 1809.

```bash
docker-compose up -d
```

And finally, you can access to your `whoami` server throught Træfɪk, on the domain name `{containerName}.{configuredDomain}`:

```bash
PS C:\Users\stefan\code\dockerfiles-windows\traefik> docker-compose up -d
Starting traefik_whoami2_1 ... done
Starting traefik_whoami1_1 ... done
Starting traefik_traefik_1 ... done
PS C:\Users\stefan\code\dockerfiles-windows\traefik>
PS C:\Users\stefan\code\dockerfiles-windows\traefik>
PS C:\Users\stefan\code\dockerfiles-windows\traefik> docker ps
CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS              PORTS                                                              NAMES
113ce8f5c552        stefanscherer/whoami            "\\http.exe"             32 minutes ago      Up 4 seconds        8080/tcp                                                           traefik_whoami1_1
44c88c5055f0        stefanscherer/traefik-windows   "/traefik --configfi…"   32 minutes ago      Up 4 seconds        0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp, 0.0.0.0:8080->8080/tcp   traefik_traefik_1
88673d7e3c03        stefanscherer/whoami            "\\http.exe"             32 minutes ago      Up 4 seconds        8080/tcp                                                           traefik_whoami2_1
PS C:\Users\stefan\code\dockerfiles-windows\traefik> curl.exe -H Host:whoami.docker.local http://localhost
I'm 113ce8f5c552 running on windows/amd64
PS C:\Users\stefan\code\dockerfiles-windows\traefik> curl.exe -H Host:whoami.docker.local http://localhost
I'm 88673d7e3c03 running on windows/amd64
PS C:\Users\stefan\code\dockerfiles-windows\traefik>
```

The Dashboard UI [http://localhost:8080](http://localhost:8080) will give you an overview of the frontends/backends and also a health dashboard.

Never expose the API/Dashboard UI publicly (<https://docs.traefik.io/configuration/api/#security>).

![Dashboard UI Providers](https://traefik.io/web.frontend.png)

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
