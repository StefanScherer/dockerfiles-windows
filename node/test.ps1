function testVersion($majorMinorPatch) {
  docker run node:$majorMinorPatch node --version
  $ErrorActionPreference = 'SilentlyContinue';
  docker run node:$majorMinorPatch npm.cmd --version
  $ErrorActionPreference = 'Stop';
  docker run node:$majorMinorPatch-nano node --version
  $ErrorActionPreference = 'SilentlyContinue';
  docker run node:$majorMinorPatch-nano npm.cmd --version
  $ErrorActionPreference = 'Stop';
}

testVersion "6.11.2"
testVersion "8.4.0"
