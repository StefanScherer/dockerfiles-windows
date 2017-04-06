call _presetvars.bat

docker tag %ImageNameVersion% %DockerRepo%/%ImageNameVersion%
docker tag %ImageNameVersion% %DockerRepo%/%ImageNameLatest%

echo docker push %DockerRepo%/%ImageNameVersion%
echo docker push %DockerRepo%/%ImageNameLatest%
