$version=$(select-string -Path Dockerfile -Pattern "ENV APACHE_VERSION").ToString().split()[-1]
docker build -t apache:$version .
