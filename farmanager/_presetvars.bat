set /p NavVersion=<__imageversion.txt
set /p ImageName=<__imagename.txt
set /p DockerRepo=<%~dp0..\__dockerreponame.txt

set ImageNameVersion=%ImageName%:%NavVersion%
set ImageNameLatest=%ImageName%:latest
set ContainerNameDefault=%ImageNameVersion::=_%

echo %DockerRepo%