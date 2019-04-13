$version=$(select-string -Path Dockerfile -Pattern "ENV MONGO_VERSION").ToString().split()[-1]

docker tag mongo:nano stefanscherer/mongo-windows:$version
docker push stefanscherer/mongo-windows:$version
docker tag mongo:nano stefanscherer/mongo-windows:latest
docker push stefanscherer/mongo-windows:latest
