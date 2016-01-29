# compose multiple containers on Windows

## Install docker-compose

```
choco install -y docker-compose
```

## Run the containers

```
docker-compose up
```

At the moment I only got a `docker-compose.yml` working with `net: none` in the yml file.
AFAIK there are no links at the moment so you need some other way for service discovery.
