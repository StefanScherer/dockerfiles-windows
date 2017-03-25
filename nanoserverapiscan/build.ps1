docker rm -f nano 2>nul
docker create --name nano microsoft/nanoserver
mkdir tmp
docker cp nano:Windows/System32/Forwarders tmp
docker build -t win10sdk -f Dockerfile.build .
docker rm -f win10sdk 2>nul
docker create --name win10sdk win10sdk
mkdir tmp\kit\um\x64
mkdir tmp\kit\ucrt\x64
docker cp "win10sdk:Program Files (x86)/Windows Kits/10/Lib/10.0.14393.0/um/x64" tmp/kit/um/x64
docker cp "win10sdk:Program Files (x86)/Windows Kits/10/Lib/10.0.14393.0/ucrt/x64" tmp/kit/ucrt/x64

docker build -t nanoserverapiscan .
docker build -t nanoserverapiscan:onbuild onbuild
