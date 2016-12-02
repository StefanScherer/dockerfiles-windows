setlocal
if not exist docker (
  git clone https://github.com/docker/docker
)
if not exist binary (
  mkdir binary
)
set BINDIR=%cd%
set image=docker
pushd docker
if not "%1x"=="x" (
  git fetch origin pull/%1/head:pr%1
  git checkout pr%1
  set image=dockerpr%1
)
docker build -t %image% -f Dockerfile.windows .
docker run --name %image% %image% hack\make.ps1 -Binary
docker cp %image%:C:\go\src\github.com\docker\docker\bundles\docker.exe ..\binary\docker.exe
docker cp %image%:C:\go\src\github.com\docker\docker\bundles\dockerd.exe ..\binary\dockerd.exe
popd
dir binary
