. $PSScriptRoot\..\update-docker-ce.ps1

function buildVersion($majorMinorPatch, $majorMinor, $major) {
  docker build -t node:$majorMinorPatch $majorMinor
  docker tag node:$majorMinorPatch node:latest
  docker tag node:$majorMinorPatch node:$majorMinor
  docker tag node:$majorMinorPatch node:$major
  docker tag node:$majorMinorPatch node:$majorMinorPatch-windowsservercore

  docker build -t node:$majorMinorPatch-onbuild $majorMinor/onbuild
  docker tag node:$majorMinorPatch-onbuild node:$majorMinor-onbuild
  docker tag node:$majorMinorPatch-onbuild node:$major-onbuild

  docker build -t node:$majorMinorPatch-nano $majorMinor/nano
  docker tag node:$majorMinorPatch-nano node:latest-nano
  docker tag node:$majorMinorPatch-nano node:$majorMinor-nano
  docker tag node:$majorMinorPatch-nano node:$major-nano
  docker tag node:$majorMinorPatch-nano node:$majorMinorPatch-nanoserver

  docker build -t node:$majorMinorPatch-nano-onbuild $majorMinor/nano/onbuild
  docker tag node:$majorMinorPatch-nano-onbuild node:$majorMinor-nano-onbuild
  docker tag node:$majorMinorPatch-nano-onbuild node:$major-nano-onbuild
}

buildVersion "6.11.0" "6.11" "6"
buildVersion "8.1.3" "8.1" "8"
