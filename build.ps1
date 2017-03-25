$ErrorActionPreference = 'Stop';
$files = ""
Write-Host Starting build

Write-Host Updating base images
docker pull microsoft/windowsservercore
docker pull microsoft/nanoserver

if ( $env:APPVEYOR_PULL_REQUEST_NUMBER ) {
  Write-Host Pull request $env:APPVEYOR_PULL_REQUEST_NUMBER
  $files = $(git --no-pager diff --name-only FETCH_HEAD $(git merge-base FETCH_HEAD master))
} else {
  Write-Host Branch $env:APPVEYOR_REPO_BRANCH
  $files = $(git diff --name-only HEAD~1)
}

Write-Host Changed files:

$dirs = @{}

$files | ForEach-Object {
  Write-Host $_
  $dir = $_ -replace "\/[^\/]+$", ""
  $dir = $dir -replace "/", "\"
  if (Test-Path "$dir\build.ps1") {
    Write-Host "Storing $dir for build"
    $dirs.Set_Item($dir, 1)
  } else {
    $dir = $dir -replace "\\[^\\]+$", ""
    if (Test-Path "$dir\build.ps1") {
      Write-Host "Storing $dir for build"
      $dirs.Set_Item($dir, 1)
    }
  }
}

$dirs.GetEnumerator() | Sort-Object Name | ForEach-Object {
  $dir = $_.Name
  Write-Host Building in directory $dir
  pushd $dir
  .\build.ps1
  popd
}

docker images
