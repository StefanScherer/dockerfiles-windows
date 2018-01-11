# Build docker-compose.exe for a specific pull request

Example: Build pull request docker/compose#5560

```
docker build --build-arg 5560 -t compose .
docker create compose
docker cp $(docker ps -ql):code/compose/dist/docker-compose-Windows-x86_64.exe .
```
