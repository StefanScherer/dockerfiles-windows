# Jenkins

```bash
$ docker build -t jenkins .
$ mkdir jenkinsdata
$ docker run -it -p 8080:8080 -v C:$(pwd)/jenkinsdata:C:/jenkins jenkins
$ open http://$(docker-machine ip windows):8080
```
