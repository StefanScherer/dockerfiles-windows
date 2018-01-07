$version=$(select-string -Path Dockerfile -Pattern "ENV PERL_VERSION").ToString().split()[-1]
docker tag perl stefanscherer/perl-windows:$version
docker push stefanscherer/perl-windows:$version
docker tag perl stefanscherer/perl-windows:latest
docker push stefanscherer/perl-windows:latest
