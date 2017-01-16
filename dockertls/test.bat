mkdir server
mkdir client\.docker
docker run --rm -e SERVER_NAME=test -e IP_ADDRESSES=127.0.0.1 -v "%cd%\server:c:\programdata\docker" -v "%cd%\client\.docker:c:\users\containeradministrator\.docker" dockertls
dir server\certs.d
dir server\config
dir client\.docker
