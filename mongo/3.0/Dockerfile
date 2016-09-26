FROM microsoft/windowsservercore
MAINTAINER scherer_stefan@icloud.com

ENV MONGO_MAJOR 3.0
ENV MONGO_VERSION 3.0.9

RUN powershell -Command wget -Uri https://fastdl.mongodb.org/win32/mongodb-win32-x86_64-2008plus-ssl-%MONGO_VERSION%-signed.msi -OutFile mongodb.msi -UseBasicParsing

RUN msiexec.exe /q /i mongodb.msi INSTALLLOCATION=C:\mongodb ADDLOCAL=Server,Client,MonitoringTools,ImportExportTools,MiscellaneousTools

RUN mkdir \data\db
# The VOLUME keyword is not supported on Windows yet
# VOLUME /data/db

# The EXPOSE keyword is not supported on Windows yet
# EXPOSE 27017

CMD ["C:/mongodb/bin/mongod.exe"]
