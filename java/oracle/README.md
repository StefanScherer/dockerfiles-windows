# Oracle Java on Docker

Build a Docker image containing Oracle Java (Server JRE specifically).

The Oracle Java Server JRE provides the same features as Oracle Java JDK commonly required for Server-side Applications (i.e. Java EE application servers). For more information about Server JRE, visit this [release notes](http://www.oracle.com/technetwork/java/javase/7u21-relnotes-1932873.html#serverjre).

## Java 8
[Download Server JRE 8](http://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html) `.tar.gz` file and drop it inside folder `java-8`.
Build it:

```
$ cd java-8
$ tar xzf server-jre-8u152-windows-x64.tar.gz
$ docker build -t oracle/serverjre:8-windowsservercore -f windowsservercore/Dockerfile .
$ docker build -t oracle/serverjre:8-nanoserver -f nanoserver/Dockerfile .
```

Run nanoserver container instance:

```
$ docker create -t --name 8-nanoserver -i oracle/serverjre:8-nanoserver
$ docker start -i 8-nanoserver
```

Run windows server core container instance:

```
$ docker create -t --name 8-windowsservercore -i oracle/serverjre:8-windowsservercore
$ docker start -i 8-windowsservercore
```

Test in the running container instances

```
java -version
```




## Java 7
[Download Server JRE 7](http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html#sjre-7u80-oth-JPR) `.tar.gz` file and drop it inside folder `java-7`. You also have to extract all files as there are issues adding the `tar.gz` file directly.
Build it:

```
$ cd java-7
$ tar xzf server-jre-7u80-windows-x64.tar.gz
$ docker build -t oracle/serverjre:7-windowsservercore -f windowsservercore/Dockerfile .
$ docker build -t oracle/serverjre:7-nanoserver -f nanoserver/Dockerfile .
```

Run nanoserver container instance:

```
$ docker create -t --name 7-nanoserver -i oracle/serverjre:7-nanoserver
$ docker start -i 7-nanoserver
```

Run windows server core container instance:

```
$ docker create -t --name 7-windowsservercore -i oracle/serverjre:7-windowsservercore
$ docker start -i 7-windowsservercore
```

Test in the running container instances

```
java -version
```