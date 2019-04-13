$version=$(select-string -Path Dockerfile -Pattern "ENV APACHE_VERSION").ToString().split()[-1]
docker tag apache:$version stefanscherer/apache-windows:$version
docker push stefanscherer/apache-windows:$version
docker tag apache:$version stefanscherer/apache-windows:latest
docker push stefanscherer/apache-windows:latest
