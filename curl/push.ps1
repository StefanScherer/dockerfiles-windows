$version=$(select-string -Path Dockerfile -Pattern "ENV CURL_VERSION").ToString().split()[-1]
docker tag curl stefanscherer/curl-windows:$version
docker push stefanscherer/curl-windows:$version
docker tag curl stefanscherer/curl-windows:latest
docker push stefanscherer/curl-windows:latest
