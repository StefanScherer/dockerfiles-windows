FROM microsoft/windowsservercore:latest

ENV JAVA_PKG=jdk1.7.0_80/ \
    JAVA_HOME=C:\\jdk1.7.0_80

ADD $JAVA_PKG $JAVA_HOME

RUN setx /M PATH %PATH%;%JAVA_HOME%\bin
