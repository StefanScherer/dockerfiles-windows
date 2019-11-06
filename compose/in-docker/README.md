# Run docker-compose inside a Windows container

## Build the test image

```
docker build -t compose-in-docker .
```

## Run docker-compose

```
docker run -v //./pipe/docker_engine://./pipe/docker_engine -it compose-in-docker docker-compose up
```
