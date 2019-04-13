FROM stefanscherer/msbuild:14.0 as build
COPY . .
RUN msbuild realpath.sln /p:Configuration=Release /p:Platform=x64
FROM mcr.microsoft.com/windows/servercore:ltsc2016
COPY --from=build /code/x64/release/realpath.exe realpath.exe
CMD [ "/realpath.exe" ]
