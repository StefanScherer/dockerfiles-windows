if not exist docker (
  git clone https://github.com/docker/docker
)
cd docker
git stash
git pull
copy /Y ..\patch\Dockerfile.windows .
copy /Y ..\patch\hack\make.ps1 hack
copy /Y ..\patch\hack\make\go-autogen.ps1 hack\make
powershell -file .\hack\make.ps1
