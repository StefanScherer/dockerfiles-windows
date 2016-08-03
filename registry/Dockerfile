FROM microsoft/windowsservercore:10.0.14300.1030

COPY ./registry.exe /registry.exe
COPY config.yml /config/config.yml

# VOLUME ["/registry"]
# EXPOSE 5000

ENTRYPOINT ["\\registry.exe"]
CMD ["serve", "/config/config.yml"]
