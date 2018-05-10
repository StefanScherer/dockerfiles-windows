function pushVersion($majorMinorPatch, $majorMinor, $major) {
  docker tag node:$majorMinorPatch-windowsservercore stefanscherer/node-windows:$majorMinorPatch-windowsservercore-2016
  docker tag node:$majorMinorPatch-nanoserver stefanscherer/node-windows:$majorMinorPatch-nanoserver-2016

  docker push stefanscherer/node-windows:$majorMinorPatch-windowsservercore-2016
  docker push stefanscherer/node-windows:$majorMinorPatch-nanoserver-2016

  if (Test-Path $majorMinor\build-tools) {
    docker tag node:$majorMinorPatch-build-tools stefanscherer/node-windows:$majorMinorPatch-build-tools
    docker tag node:$majorMinorPatch-build-tools stefanscherer/node-windows:$majorMinor-build-tools
    docker tag node:$majorMinorPatch-build-tools stefanscherer/node-windows:$major-build-tools
    docker push stefanscherer/node-windows:$majorMinorPatch-build-tools
    docker push stefanscherer/node-windows:$majorMinor-build-tools
    docker push stefanscherer/node-windows:$major-build-tools
  }

  rebase-docker-image stefanscherer/node-windows:$majorMinorPatch-nanoserver-2016 -t stefanscherer/node-windows:$majorMinorPatch-nanoserver-1709 -b microsoft/nanoserver:1709
  rebase-docker-image stefanscherer/node-windows:$majorMinorPatch-nanoserver-2016 -t stefanscherer/node-windows:$majorMinorPatch-nanoserver-1803 -b microsoft/nanoserver:1803

  $coreManifest = @"
image: stefanscherer/node-windows:{0}-windowsservercore
tags: ['{1}-windowsservercore', '{2}-windowsservercore', 'windowsservercore']
manifests:
  -
    image: stefanscherer/node-windows:{0}-windowsservercore-2016
    platform:
      architecture: amd64
      os: windows
"@

  $coreManifest -f $majorMinorPatch, $majorMinor, $major | Out-File windowsservercore.yml -Encoding Ascii
  cat windowsservercore.yml
  manifest-tool push from-spec windowsservercore.yml

  $nanoManifest = @"
image: stefanscherer/node-windows:{0}
tags: ['{0}-nanoserver', '{1}-nanoserver', '{2}-nanoserver', 'nanoserver', '{1}', '{2}', 'latest']
manifests:
  -
    image: stefanscherer/node-windows:{0}-nanoserver-2016
    platform:
      architecture: amd64
      os: windows
  -
    image: stefanscherer/node-windows:{0}-nanoserver-1709
    platform:
      architecture: amd64
      os: windows
  -
    image: stefanscherer/node-windows:{0}-nanoserver-1803
    platform:
      architecture: amd64
      os: windows
"@

  $nanoManifest -f $majorMinorPatch, $majorMinor, $major | Out-File nanoserver.yml -Encoding Ascii
  cat nanoserver.yml
  manifest-tool push from-spec nanoserver.yml
}

npm install -g rebase-docker-image
choco install -y manifest-tool

pushVersion "6.14.2" "6.14" "6"
#pushVersion "8.11.1" "8.11" "8"
#pushVersion "9.11.1" "9.11" "9"
pushVersion "10.1.0" "10.1" "10"
