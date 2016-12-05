$ErrorActionPreference = 'Stop';

if ( $env:APPVEYOR_PULL_REQUEST_NUMBER -Or ! $env:APPVEYOR_REPO_BRANCH.Equals("master")) {
  Write-Host Nothing to deploy.
  Exit 0
}

$files = ""
Write-Host Starting deploy

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
    if (Test-Path "$dir\push.bat") {
      Write-Host Building in directory $dir
      pushd $dir
      . .\push.bat
      popd
    } else {
      $dir = $dir -replace "\\[^\\]+", ""
      if (Test-Path "$dir\push.bat") {
        Write-Host Building in directory $dir
        pushd $dir
        . .\push.bat
        popd
      }
    }
  }
}
