FROM openjdk:8-windowsservercore

ENV JENKINS_SWARM_VERSION 3.3
ENV HOME /jenkins-slave

RUN mkdir \jenkins-slave
RUN powershell -Command Invoke-WebRequest $('https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/{0}/swarm-client-{0}.jar' -f $env:JENKINS_SWARM_VERSION) -OutFile 'swarm-client.jar' -UseBasicParsing ;

COPY jenkins-slave.cmd /jenkins-slave.cmd

VOLUME C:\\jenkins-slave

ENTRYPOINT [ "cmd", "/C", "C:\\jenkins-slave.cmd" ]
