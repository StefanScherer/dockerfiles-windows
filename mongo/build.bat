pushd 3.2
docker build -t mongo-builder -f Dockerfile.build .
docker run -v %cd%:C:\share mongo-builder
docker build -t mongo .
docker tag -f mongo:latest mongo:3.2.3
popd
