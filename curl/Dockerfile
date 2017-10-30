FROM microsoft/nanoserver:10.0.14393.1770 AS download
ENV CURL_VERSION 7.56.1
WORKDIR /curl
ADD https://skanthak.homepage.t-online.de/download/curl-$CURL_VERSION.cab curl.cab
RUN expand /R curl.cab /F:* .
FROM microsoft/nanoserver:10.0.14393.1770
COPY --from=download /curl/AMD64/ /Windows/system32/
COPY --from=download /curl/CURL.LIC /
