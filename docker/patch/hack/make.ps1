$DOCKER_PKG='github.com/docker/docker'
$ErrorActionPreference = "Stop"

$VERSION = "$(cat VERSION)"

# We're a nice, sexy, little shell script, and people might try to run us;
# but really, they shouldn't. We want to be in a container!
if ( ($pwd).ToString().Replace("\", "/") -ne "C:/go/src/$DOCKER_PKG") {
  Write-Host "# WARNING! I don't seem to be running in the Docker container."
  if ( [environment]::OSVersion.Version.Build -lt 10586 ) {
    Write-Error "# ERROR! You can run this only on Windows Server 2016 TP4 or newer!"
    exit 1
  }
  Write-Host "# Building Windows container"
  docker build -t docker -f Dockerfile.windows .
  if (Test-Path bundles\${VERSION}) {
    Write-Host "# bundles\${VERSION} already exists. Removing"
    Remove-Item bundles\${VERSION} -Force -Recurse
  }
  mkdir bundles\${VERSION}
  Write-Host "# Running the build inside the Windows container"
  docker run -it -v ${pwd}\bundles:c:/go/src/github.com/docker/docker/bundles docker "powershell -file hack\make.ps1"
} else {
  Write-Host "# Running inside the container ..."

  Write-Host "# Running hack\make\go-autogen.ps1 ..."
  hack\make\go-autogen.ps1

  Write-Host "# Building docker binary ..."
  $BUILDTAGS="autogen daemon"
  go build -o ./bundles/${VERSION}/docker.exe -tags "$BUILDTAGS" -ldflags "-linkmode=internal" ./docker

  Write-Host "# Finished building bundles\${VERSION}\docker.exe"
}
