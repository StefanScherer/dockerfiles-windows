FROM microsoft/nanoserver

ENV MONGO_VERSION=3.4.1

COPY build /

RUN mkdir C:\data\db & setx /m PATH %PATH%;C:\mongodb\bin

VOLUME C:\\data\\db

EXPOSE 27017

CMD ["mongod.exe"]
