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

#buildVersion "6.14.2" "6.14" "6"
buildVersion "8.11.2" "8.11" "8"
#buildVersion "9.11.1" "9.11" "9"
#buildVersion "10.3.0" "10.3" "10"
