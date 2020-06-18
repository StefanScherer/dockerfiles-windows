rem if `docker run` first argument start with `-` the user is passing jenkins swarm launcher arguments
rem if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then

  set JAR=/swarm-client.jar

  rem if -master is not provided and using --link jenkins:jenkins
  rem if [[ "$@" != *"-master "* ]] && [ ! -z "$JENKINS_PORT_8080_TCP_ADDR" ]; then
  rem   set PARAMS="-master http://%JENKINS_PORT_8080_TCP_ADDR%:%JENKINS_PORT_8080_TCP_PORT%"
  rem fi

  echo Running java %JAVA_OPTS% -jar %JAR% -fsroot %HOME% %PARAMS% %*
  java %JAVA_OPTS% -jar %JAR% -fsroot %HOME% %PARAMS% %*
rem fi
  echo Java stopped with exit code %ERRORLEVEL%
  
rem As argument is not jenkins, assume user want to run his own process, for sample a `bash` shell to explore this image
rem start %*
