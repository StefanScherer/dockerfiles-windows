function testVersion($majorMinorPatch) {
  docker run node:$majorMinorPatch-windowsservercore node --version
  $ErrorActionPreference = 'SilentlyContinue';
  docker run node:$majorMinorPatch-windowsservercore npm.cmd --version
  $ErrorActionPreference = 'Stop';
  docker run node:$majorMinorPatch-nanoserver node --version
  $ErrorActionPreference = 'SilentlyContinue';
  docker run node:$majorMinorPatch-nanoserver npm.cmd --version
  $ErrorActionPreference = 'Stop';
}

testVersion "6.11.5"
testVersion "8.6.0"
