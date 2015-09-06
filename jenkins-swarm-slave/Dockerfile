FROM java:8u60-jdk

MAINTAINER Stefan Scherer <scherer_stefan@icloud.com>

ENV JENKINS_SWARM_VERSION 2.0
ENV HOME /jenkins-slave

RUN mkdir \jenkins-slave
RUN powershell -Command "wget -Uri http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$env:JENKINS_SWARM_VERSION/swarm-client-$env:JENKINS_SWARM_VERSION-jar-with-dependencies.jar -OutFile /swarm-client.jar -UseBasicParsing"

COPY jenkins-slave.cmd /jenkins-slave.cmd

# VOLUME /jenkins-slave

ENTRYPOINT [ "cmd", "/C", "\\jenkins-slave.cmd" ]
