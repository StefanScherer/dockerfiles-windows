function buildVersion($majorMinorPatch, $majorMinor, $major) {
  docker build -t node:$majorMinorPatch-windowsservercore $majorMinor

  if (Test-Path $majorMinor\build-tools) {
    docker build -t node:$majorMinorPatch-build-tools $majorMinor/build-tools
  }

  docker build -t node:$majorMinorPatch-nanoserver $majorMinor/nano
}

buildVersion "6.14.1" "6.14" "6"
#buildVersion "8.11.1" "8.11" "8"
#buildVersion "9.10.1" "9.10" "9"
