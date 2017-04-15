$ErrorActionPreference = 'SilentlyContinue';
docker run --rm -e SERVER_NAME=test -e IP_ADDRESSES=127.0.0.1 dockertls 2>&1
$ErrorActionPreference = 'Stop';
