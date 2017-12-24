FROM microsoft/windowsservercore:latest

ENV JAVA_PKG=jdk1.8.0_152/ \
    JAVA_HOME=C:\\jdk1.8.0_152

ADD $JAVA_PKG $JAVA_HOME

RUN setx /M PATH %PATH%;%JAVA_HOME%\bin
