FROM microsoft/nanoserver:10.0.14393.2068 AS download
ENV CURL_VERSION 7.58.0
WORKDIR /curl
ADD https://skanthak.homepage.t-online.de/download/curl-$CURL_VERSION.cab curl.cab
RUN expand /R curl.cab /F:* .

FROM microsoft/nanoserver:10.0.14393.2068
COPY --from=download /curl/AMD64/ /
COPY --from=download /curl/CURL.LIC /
ENTRYPOINT ["curl.exe"]
