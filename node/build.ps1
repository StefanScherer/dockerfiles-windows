function buildVersion($majorMinorPatch, $majorMinor, $major) {
  docker build -t node:$majorMinorPatch-windowsservercore $majorMinor

  if (Test-Path $majorMinor\build-tools) {
    docker build -t node:$majorMinorPatch-build-tools $majorMinor/build-tools
  }

  docker build -t node:$majorMinorPatch-nanoserver $majorMinor/nano
}

# buildVersion "6.13.0" "6.13" "6"
buildVersion "9.7.1" "9.7" "9"
buildVersion "8.9.4" "8.9" "8"
