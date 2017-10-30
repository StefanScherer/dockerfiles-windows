$version=$(select-string -Path Dockerfile -Pattern "ENV CURL_VERSION").ToString().split()[-1]
docker tag curl stefanscherer/curl-windows:$version-2016
docker push stefanscherer/curl-windows:$version-2016

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/curl-windows:$version-2016 -t stefanscherer/curl-windows:$version-1709 -b microsoft/nanoserver:1709

choco install -y manifest-tool
manifest-tool push from-spec manifest.yml
