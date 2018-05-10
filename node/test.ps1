function testCommand($image, $command, $expected) {
  Write-Host "Testing: docker run $image $command --version"
  $ErrorActionPreference = 'SilentlyContinue';
  $actual = $(docker run $image $command --version)
  $ErrorActionPreference = 'Stop';
  Write-Host $actual
  if ($LastExitCode) {
    Write-Error "Command exited with error $LastExitCode"
  }
  if ($expected -and ($actual -ne $expected)) {
    Write-Error "Expected '$expected', but got '$actual'"
  }
  if ($actual -eq "") {
    Write-Error "Expected some output, but got '$actual'"
  }
}

function testVersion($majorMinorPatch) {
  testCommand "node:$majorMinorPatch-windowsservercore" "node" "v$majorMinorPatch"
  testCommand "node:$majorMinorPatch-windowsservercore" "npm.cmd" ""
  testCommand "node:$majorMinorPatch-windowsservercore" "yarn.cmd" ""

  testCommand "node:$majorMinorPatch-nanoserver" "node" "v$majorMinorPatch"
  testCommand "node:$majorMinorPatch-nanoserver" "npm.cmd" ""
  testCommand "node:$majorMinorPatch-nanoserver" "yarn.cmd" ""
}

testVersion "6.14.2"
#testVersion "8.11.1"
#testVersion "9.11.1"
testVersion "10.1.0"
