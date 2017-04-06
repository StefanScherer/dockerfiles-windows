call _presetvars.bat

docker build -t %ImageNameVersion% .
docker tag %ImageNameVersion% %ImageNameLatest%