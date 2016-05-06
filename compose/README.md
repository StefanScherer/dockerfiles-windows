# compose multiple containers on Windows

## Install docker-compose

```
choco install -y docker-compose
```

## Run the containers

```
docker-compose up --build
```

At the moment the two containers start, but the app container does not have a hosts entry for the mongo container.
I've added a sleep to exec into the container and check the c:\windows\system32\drivers\etc\hosts file.

## Stop the setup

```
docker-compose kill
```
