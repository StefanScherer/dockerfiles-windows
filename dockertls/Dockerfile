FROM stefanscherer/openssl-windows
MAINTAINER scherer_stefan@icloud.com

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

RUN Invoke-WebRequest -Uri https://github.com/Microsoft/Virtualization-Documentation/raw/master/windows-server-container-tools/DockerTLS/DockerCertificateTools.ps1 -OutFile DockerCertificateTools.ps1

CMD . .\DockerCertificateTools.ps1 ; \
    New-OpenSSLCertAuth ; \
    New-ClientKeyandCert ; \
    New-ServerKeyandCert -serverName $('{0}' -f $env:SERVER_NAME) -serverIPAddresses @( $($env:IP_ADDRESSES).Split(' ')) ; \
    Copy C:\MyDockerKeys\ca-key.pem C:\certs ; \
    Copy C:\MyDockerKeys\ca.pem C:\certs ; \
    Copy C:\MyDockerKeys\cert.pem C:\certs ; \
    Copy C:\MyDockerKeys\$($env:SERVER_NAME)_server-cert.pem C:\certs\server-cert.pem ; \
    Copy C:\MyDockerKeys\$($env:SERVER_NAME)_server-key.pem C:\certs\server-key.pem
