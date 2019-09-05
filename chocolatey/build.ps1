docker build --build-arg version=ltsc2019 -t chocolatey:0.10.15 .
docker tag chocolatey:0.10.15 chocolatey:latest
