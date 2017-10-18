FROM microsoft/windowsservercore:10.0.14393.1770

ENV MONGO_VERSION=3.2.11

COPY build /

RUN mkdir C:\data\db & setx /m PATH %PATH%;C:\mongodb\bin

VOLUME C:\\data\\db

EXPOSE 27017

CMD ["mongod.exe"]
