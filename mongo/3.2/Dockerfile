FROM windowsservercore
MAINTAINER scherer_stefan@icloud.com

ENV MONGO_MAJOR=3.2 \
    MONGO_VERSION=3.2.6

COPY build /

# The VOLUME keyword is not supported on Windows yet
# VOLUME /data/db

# The EXPOSE keyword is not supported on Windows yet
# EXPOSE 27017

CMD ["C:/mongodb/bin/mongod.exe"]
