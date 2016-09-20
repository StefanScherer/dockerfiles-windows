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
rem workaround from https://github.com/docker/docker/pull/26722
docker tag microsoft/windowsservercore:latest windowsservercore:latest
docker build -t %image% -f Dockerfile.windows .
docker run --rm -v "%BINDIR%:c:\target" %image% sh -c 'cd /c/go/src/github.com/docker/docker; hack/make.sh binary; ec=$?; if [ $ec -eq 0 ]; then robocopy /c/go/src/github.com/docker/docker/bundles/$(cat VERSION)/binary-client /c/target/binary; robocopy /c/go/src/github.com/docker/docker/bundles/$(cat VERSION)/binary-daemon /c/target/binary; fi; exit $ec'
popd
dir binary
