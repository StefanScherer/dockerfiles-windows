# Compose Linux + Windows containers

In LCOW mode it is possible to use `docker-compose` to mix Linux and Windows containers.

## Example

I had to cheat a little bit.

Pre-pull the Linux image with the `--platform` option.

```
docker pull --platform linux tutum/curl:alpine
```

```
docker-compose up
```

The hosts table does not have the `win` machine.

In a different terminal run

```
docker inspect lcow_win_1
```

Fetch the IPAddress of the Window container. Now enter the Linux container and append the `win` container to the hosts table.

```
docker-compose exec lin sh
echo "1.2.3.4 win" >> /etc/hosts
```
