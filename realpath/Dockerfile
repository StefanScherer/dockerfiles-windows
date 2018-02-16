FROM stefanscherer/msbuild:14.0 as build
COPY . .
RUN msbuild realpath.sln /p:Configuration=Release /p:Platform=x64
FROM microsoft/windowsservercore:10.0.14393.2068
COPY --from=build /code/x64/release/realpath.exe realpath.exe
CMD [ "/realpath.exe" ]
