setlocal
if not exist docker (
  git clone https://github.com/docker/docker
)
if not exist binary (
  mkdir binary
)
set BINDIR=%cd%
pushd docker
docker build -t docker -f Dockerfile.windows .
docker run --rm -v "%BINDIR%:c:\target" docker sh -c 'cd /c/go/src/github.com/docker/docker; hack/make.sh binary; ec=$?; if [ $ec -eq 0 ]; then robocopy /c/go/src/github.com/docker/docker/bundles/$(cat VERSION)/binary /c/target/binary; fi; exit $ec'
popd
dir binary
