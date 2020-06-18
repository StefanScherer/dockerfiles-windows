# Jenkins swarm agent

A Windows Jenkins Swarm agent running in a Windows Docker container.
Based on the linux version [csanchez/jenkins-swarm-agent](https://github.com/carlossg/jenkins-swarm-agent-docker).

## Building the container image

```
docker build -t jenkins-swarm-agent .
```

## Running the container

To run a Docker container passing [any parameter](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin#SwarmPlugin-AvailableOptions) to the agent

```
docker run jenkins-swarm-agent -master http://192.168.99.100:8080 -name windows-agent -username jenkins -password jenkins -executors 1
```
