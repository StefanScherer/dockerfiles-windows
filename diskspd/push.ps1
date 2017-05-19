$version=$(select-string -Path Dockerfile -Pattern "ENV DISKSPD_VERSION").ToString().split()[-1]
docker tag diskspd stefanscherer/diskspd:$version
docker tag diskspd:nano stefanscherer/diskspd:$version-nano
docker tag diskspd stefanscherer/diskspd:latest
docker tag diskspd:nano stefanscherer/diskspd:nano
docker push stefanscherer/diskspd:$version
docker push stefanscherer/diskspd:$version-nano
docker push stefanscherer/diskspd:latest
docker push stefanscherer/diskspd:nano
