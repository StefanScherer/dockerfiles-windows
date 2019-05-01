docker build -t winrm:1809 .
docker build --isolation hyperv -t winrm:2016 --build-arg TAG=ltsc2016 .
