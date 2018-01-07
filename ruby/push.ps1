$version=$(select-string -Path Dockerfile -Pattern "ENV RUBY_VERSION").ToString().split()[-1]
docker tag ruby stefanscherer/ruby-windows:$version
docker push stefanscherer/ruby-windows:$version
docker tag ruby stefanscherer/ruby-windows:latest
docker push stefanscherer/ruby-windows:latest
