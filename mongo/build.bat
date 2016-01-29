docker build -t mongo 3.0
docker tag mongo:latest mongo:3.0.9
docker build -t mongo 3.2
docker tag mongo:latest mongo:3.2.1
