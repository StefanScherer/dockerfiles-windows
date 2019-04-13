FROM mcr.microsoft.com/windows/servercore:ltsc2016 AS download
ENV CURL_VERSION 7.64.1
WORKDIR /curl
ADD https://skanthak.homepage.t-online.de/download/curl-$CURL_VERSION.cab curl.cab
RUN expand /R curl.cab /F:* .

FROM mcr.microsoft.com/windows/servercore:ltsc2016
COPY --from=download /curl/AMD64/ /
COPY --from=download /curl/CURL.LIC /
ENTRYPOINT ["curl.exe"]
