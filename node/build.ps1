function buildVersion($majorMinorPatch, $majorMinor, $major) {
  docker build -t node:$majorMinorPatch-windowsservercore $majorMinor

  if (Test-Path $majorMinor\build-tools) {
    docker build -t node:$majorMinorPatch-build-tools $majorMinor/build-tools
  }

  docker build -t node:$majorMinorPatch-nanoserver $majorMinor/nano
}

# buildVersion "6.13.1" "6.13" "6"
buildVersion "8.10.0" "8.10" "8"
buildVersion "9.9.0" "9.9" "9"
