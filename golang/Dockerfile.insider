FROM mcr.microsoft.com/windowsservercore-insider:10.0.17744.1001 AS builder

# $ProgressPreference: https://github.com/PowerShell/PowerShell/issues/2138#issuecomment-251261324
SHELL ["powershell.exe", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV GOLANG_VERSION 1.11

RUN $url = ('https://golang.org/dl/go{0}.windows-amd64.zip' -f $env:GOLANG_VERSION); \
	Write-Host ('Downloading {0} ...' -f $url); \
	Invoke-WebRequest -Uri $url -OutFile 'go.zip'; \
	\
	$sha256 = '29f9291270f0b303d0b270f993972ead215b1bad3cc674a0b8a09699d978aeb4'; \
	Write-Host ('Verifying sha256 ({0}) ...' -f $sha256); \
	if ((Get-FileHash go.zip -Algorithm sha256).Hash -ne $sha256) { \
		Write-Host 'FAILED!'; \
		exit 1; \
	}; \
	\
	Write-Host 'Expanding ...'; \
	Expand-Archive go.zip -DestinationPath C:\; \
	\
	Write-Host 'Removing ...'; \
	Remove-Item go.zip -Force; \
	\
	Write-Host 'Complete.';

ENV GIT_VERSION 2.18.0
ENV GIT_DOWNLOAD_URL https://github.com/git-for-windows/git/releases/download/v${GIT_VERSION}.windows.1/MinGit-${GIT_VERSION}-64-bit.zip
ENV GIT_SHA256 1dfd05de1320d57f448ed08a07c0b9de2de8976c83840f553440689b5db6a1cf

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; \
		Invoke-WebRequest -UseBasicParsing $env:GIT_DOWNLOAD_URL -OutFile git.zip; \
    if ((Get-FileHash git.zip -Algorithm sha256).Hash -ne $env:GIT_SHA256) {exit 1} ; \
    Expand-Archive git.zip -DestinationPath C:\git; \
    Remove-Item git.zip

FROM mcr.microsoft.com/nanoserver-insider:10.0.17744.1001

COPY --from=builder /go /go
COPY --from=builder /git /git

# ideally, this would be C:\go to match Linux a bit closer, but C:\go is the recommended install path for Go itself on Windows
ENV GOPATH C:\\gopath
WORKDIR $GOPATH

USER ContainerAdministrator
RUN setx /m PATH "%PATH%;C:\%GOPATH%\bin;C:\go\bin;C:\git\cmd;C:\git\mingw64\bin;C:\git\usr\bin"
USER ContainerUser
