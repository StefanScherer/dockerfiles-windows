function testCommand($image, $command, $expected) {
  Write-Host "Testing docker image $image with command $command --version"
  $ErrorActionPreference = 'SilentlyContinue';
  $actual = $(docker run $image $command --version)
  $ErrorActionPreference = 'Stop';
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

  testCommand "node:$majorMinorPatch-nanoserver" "node" "v$majorMinorPatch"
  testCommand "node:$majorMinorPatch-nanoserver" "npm.cmd" ""
}

testVersion "6.11.5"
testVersion "8.6.0"
