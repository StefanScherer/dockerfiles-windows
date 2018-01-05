# This dockerfile utilizes components licensed by their respective owners/authors.

FROM microsoft/windowsservercore:10.0.14393.2007

LABEL Description="IIS" Vendor="Microsoft" Version="10"

RUN powershell -Command Add-WindowsFeature Web-Server

CMD [ "ping", "localhost", "-t" ]
