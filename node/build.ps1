function buildVersion($majorMinorPatch, $majorMinor, $major) {
  docker build -t node:$majorMinorPatch-windowsservercore $majorMinor

  if (Test-Path $majorMinor\build-tools) {
    docker build -t node:$majorMinorPatch-build-tools $majorMinor/build-tools
  }

  docker build -t node:$majorMinorPatch-nanoserver $majorMinor/nano
}

#buildVersion "6.14.2" "6.14" "6"
buildVersion "8.11.2" "8.11" "8"
#buildVersion "9.11.1" "9.11" "9"
buildVersion "10.2.0" "10.2" "10"
