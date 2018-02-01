function buildVersion($majorMinorPatch, $majorMinor, $major) {
  docker build -t node:$majorMinorPatch-windowsservercore $majorMinor

  if (Test-Path $majorMinor\build-tools) {
    docker build -t node:$majorMinorPatch-build-tools $majorMinor/build-tools
  }

  docker build -t node:$majorMinorPatch-nanoserver $majorMinor/nano
}

buildVersion "6.12.3" "6.12" "6"
buildVersion "9.5.0" "9.5" "9"
buildVersion "8.9.4" "8.9" "8"
