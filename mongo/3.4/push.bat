docker tag mongo:3.4.1 stefanscherer/mongo-windows:3.4.1
docker tag mongo:3.4.1 stefanscherer/mongo-windows:latest

docker tag mongo:3.4.1-nano stefanscherer/mongo-windows:3.4.1-nano
docker tag mongo:3.4.1-nano stefanscherer/mongo-windows:nano

docker push stefanscherer/mongo-windows:3.4.1
docker push stefanscherer/mongo-windows:latest

docker push stefanscherer/mongo-windows:3.4.1-nano
docker push stefanscherer/mongo-windows:nano
