function buildVersion($majorMinorPatch, $majorMinor, $major) {
  docker build -t node:$majorMinorPatch-windowsservercore $major

  if (Test-Path $major\build-tools) {
    docker build -t node:$majorMinorPatch-build-tools $major/build-tools
  }

  if (Test-Path $major\pure) {
    docker build -t node:$majorMinorPatch-pure $major/pure
  }

  docker build -t node:$majorMinorPatch-nanoserver $major/nano
}

Write-Output "Running update-docker.ps1"
..\update-docker.ps1

#buildVersion "6.14.3" "6.14" "6"
#buildVersion "8.11.3" "8.11" "8"
buildVersion "10.8.0" "10.8" "10"
