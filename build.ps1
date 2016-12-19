$ErrorActionPreference = 'Stop';
$files = ""
Write-Host Starting build

Write-Host Updating base images
docker pull microsoft/windowsservercore
docker pull microsoft/nanoserver

Write-Host Removing old images
$ErrorActionPreference = 'SilentlyContinue';
docker rmi $(docker images --no-trunc | sls -notmatch -pattern '(REPOSITORY|microsoft\/(windowsservercore|nanoserver))' | Foreach {($_ -split '\s+',4)[0]})
$ErrorActionPreference = 'Stop';
Write-Host Prune system
docker system prune -f

if ( $env:APPVEYOR_PULL_REQUEST_NUMBER ) {
  Write-Host Pull request $env:APPVEYOR_PULL_REQUEST_NUMBER
  $files = $(git --no-pager diff --name-only FETCH_HEAD $(git merge-base FETCH_HEAD master))
} else {
  Write-Host Branch $env:APPVEYOR_REPO_BRANCH
  $files = $(git diff --name-only HEAD~1)
}

Write-Host Changed files:
Write-host $files

$files | ForEach-Object {
  if ($_.Contains("Dockerfile")) {
    $dir = $_ -replace "\/Dockerfile.*", ""
    $dir = $dir -replace "/", "\"
    if (Test-Path "$dir\build.bat") {
      Write-Host Building in directory $dir
      pushd $dir
      . .\build.bat
      popd
    } else {
      $dir = $dir -replace "\\[^\\]+", ""
      if (Test-Path "$dir\build.bat") {
        Write-Host Building in directory $dir
        pushd $dir
        . .\build.bat
        popd
      }
    }
  }
}

docker images
