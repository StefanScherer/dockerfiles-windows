# Jenkins swarm slave

A Windows Jenkins Swarm slave running in a Windows Docker container.
Based on the linux version [csanchez/jenkins-swarm-slave](https://github.com/carlossg/jenkins-swarm-slave-docker).

## Building the container image

```
docker build -t jenkins-swarm-slave .
```

## Running the container

To run a Docker container passing [any parameter](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin#SwarmPlugin-AvailableOptions) to the slave

```
docker run jenkins-swarm-slave -master http://192.168.99.100:8080 -name windows-slave -username jenkins -password jenkins -executors 1
```
