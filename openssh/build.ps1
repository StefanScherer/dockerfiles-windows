docker build -t openssh:1809 .
docker build --isolation hyperv -t openssh:2016 --build-arg TAG=ltsc2016 .
