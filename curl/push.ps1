$version=$(select-string -Path Dockerfile -Pattern "ENV CURL_VERSION").ToString().split()[-1]
docker tag curl stefanscherer/curl-windows
docker tag curl stefanscherer/curl-windows:$version
docker push stefanscherer/curl-windows:$version
docker push stefanscherer/curl-windows

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/curl-windows:$version -t stefanscherer/curl-windows:$version-1709 -b microsoft/nanoserver:1709
rebase-docker-image stefanscherer/curl-windows:$version -t stefanscherer/curl-windows:1709 -b microsoft/nanoserver:1709
