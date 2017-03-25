docker build -t openjdk:8-windowsservercore -f windowsservercore/Dockerfile .
docker build -t openjdk:8-nanoserver -f nanoserver/Dockerfile .

$ErrorActionPreference = 'SilentlyContinue';
docker run openjdk:8-windowsservercore java -version
docker run openjdk:8-nanoserver java -version
$ErrorActionPreference = 'Stop';
