# Apache

The Apache Web server in a Windows NanoServer container.

## Build the image

```
docker build -t apache .
```

## Run the container

```
docker run -d -p 80:80 apache
```

