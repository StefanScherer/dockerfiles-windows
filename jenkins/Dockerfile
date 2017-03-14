FROM openjdk:8-windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV HOME /jenkins
ENV JENKINS_VERSION 2.50
ENV JENKINS_HOME /jenkins
RUN mkdir \jenkins
RUN Invoke-WebRequest -Uri $('https://updates.jenkins-ci.org/download/war/{0}/jenkins.war' -f $env:JENKINS_VERSION) -UseBasicParsing -OutFile /jenkins.war

VOLUME C:\\jenkins

EXPOSE 8080

CMD [ "java", "-jar", "c:\\jenkins.war" ]
