$version=$(select-string -Path Dockerfile -Pattern "ENV POSHSPEC_VERSION").ToString().split()[-1]
docker tag poshspec stefanscherer/poshspec
docker tag poshspec stefanscherer/poshspec:$version
docker push stefanscherer/poshspec:$version
docker push stefanscherer/poshspec
