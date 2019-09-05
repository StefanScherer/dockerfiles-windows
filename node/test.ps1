function testCommand($image, $command, $expected) {
  Write-Host "Testing: docker run $image $command --version"
  $ErrorActionPreference = 'SilentlyContinue';
  $allOutput = & docker run $image $command --version 2>&1
  $stderr = $allOutput | ?{ $_ -is [System.Management.Automation.ErrorRecord] }
  $actual = $allOutput | ?{ $_ -isnot [System.Management.Automation.ErrorRecord] }
  $ErrorActionPreference = 'Stop';
  Write-Host $actual
  if ($LastExitCode) {
    Write-Error "Command exited with error $LastExitCode : $stderr"
  }
  if ($expected -and ($actual -ne $expected)) {
    Write-Error "Expected '$expected', but got '$actual'"
  }
  if ($actual -eq "") {
    Write-Error "Expected some output, but got '$actual'"
  }
}

function testVersion($majorMinorPatch, $yarnVersion) {
  testCommand "node:$majorMinorPatch-windowsservercore" "node" "v$majorMinorPatch"
  testCommand "node:$majorMinorPatch-windowsservercore" "npm.cmd" ""
  testCommand "node:$majorMinorPatch-windowsservercore" "yarn.cmd" $yarnVersion
  testCommand "node:$majorMinorPatch-windowsservercore" "git" "git version 2.20.1.windows.1"

  testCommand "node:$majorMinorPatch-nanoserver" "node" "v$majorMinorPatch"
  testCommand "node:$majorMinorPatch-nanoserver" "npm.cmd" ""
  testCommand "node:$majorMinorPatch-nanoserver" "yarn.cmd" $yarnVersion
  testCommand "node:$majorMinorPatch-nanoserver" "git" "git version 2.20.1.windows.1"

  testCommand "node:$majorMinorPatch-pure" "node" "v$majorMinorPatch"
}

#testVersion "6.14.4" "1.6.0"
#testVersion "8.11.4" "1.6.0"
testVersion "10.16.3" "1.13.0"
