function pushVersion($majorMinorPatch, $majorMinor, $major) {
  docker tag node:$majorMinorPatch-windowsservercore stefanscherer/node-windows:$majorMinorPatch-windowsservercore-2019
  docker tag node:$majorMinorPatch-nanoserver stefanscherer/node-windows:$majorMinorPatch-nanoserver-1809

  docker push stefanscherer/node-windows:$majorMinorPatch-windowsservercore-2019
  docker push stefanscherer/node-windows:$majorMinorPatch-nanoserver-1809

  if (Test-Path $major\build-tools) {
    docker tag node:$majorMinorPatch-build-tools stefanscherer/node-windows:$majorMinorPatch-build-tools
    docker tag node:$majorMinorPatch-build-tools stefanscherer/node-windows:$majorMinor-build-tools
    docker tag node:$majorMinorPatch-build-tools stefanscherer/node-windows:$major-build-tools
    docker push stefanscherer/node-windows:$majorMinorPatch-build-tools
    docker push stefanscherer/node-windows:$majorMinor-build-tools
    docker push stefanscherer/node-windows:$major-build-tools
  }

  if (Test-Path $major\pure) {
    docker tag node:$majorMinorPatch-pure stefanscherer/node-windows:$majorMinorPatch-pure-1809
    docker push stefanscherer/node-windows:$majorMinorPatch-pure-1809

    rebase-docker-image `
      stefanscherer/node-windows:$majorMinorPatch-pure-1809 `
      -s stefanscherer/nanoserver:1809 `
      -t stefanscherer/node-windows:$majorMinorPatch-pure-1803 `
      -b stefanscherer/nanoserver:1803
    rebase-docker-image `
      stefanscherer/node-windows:$majorMinorPatch-pure-1809 `
      -s stefanscherer/nanoserver:1809 `
      -t stefanscherer/node-windows:$majorMinorPatch-pure-1903 `
      -b stefanscherer/nanoserver:1903
    rebase-docker-image `
      stefanscherer/node-windows:$majorMinorPatch-pure-1809 `
      -s stefanscherer/nanoserver:1809 `
      -t stefanscherer/node-windows:$majorMinorPatch-pure-1909 `
      -b stefanscherer/nanoserver:1909
  }

  rebase-docker-image `
    stefanscherer/node-windows:$majorMinorPatch-nanoserver-1809 `
    -s stefanscherer/nanoserver:1809 `
    -t stefanscherer/node-windows:$majorMinorPatch-nanoserver-1803 `
    -b stefanscherer/nanoserver:1803
  rebase-docker-image `
    stefanscherer/node-windows:$majorMinorPatch-nanoserver-1809 `
    -s stefanscherer/nanoserver:1809 `
    -t stefanscherer/node-windows:$majorMinorPatch-nanoserver-1903 `
    -b stefanscherer/nanoserver:1903
  rebase-docker-image `
    stefanscherer/node-windows:$majorMinorPatch-nanoserver-1809 `
    -s stefanscherer/nanoserver:1809 `
    -t stefanscherer/node-windows:$majorMinorPatch-nanoserver-1909 `
    -b stefanscherer/nanoserver:1909

  $nanoManifest = @"
image: stefanscherer/node-windows:{0}
tags: ['{1}', '{2}', 'latest']
manifests:
  -
    image: stefanscherer/node-windows:{0}-nanoserver-1803
    platform:
      architecture: amd64
      os: windows
  -
    image: stefanscherer/node-windows:{0}-nanoserver-1809
    platform:
      architecture: amd64
      os: windows
  -
    image: stefanscherer/node-windows:{0}-nanoserver-1903
    platform:
      architecture: amd64
      os: windows
  -
    image: stefanscherer/node-windows:{0}-nanoserver-1909
    platform:
      architecture: amd64
      os: windows
"@

  $nanoManifest -f $majorMinorPatch, $majorMinor, $major | Out-File nanoserver.yml -Encoding Ascii
  cat nanoserver.yml
  manifest-tool push from-spec nanoserver.yml

  $pureManifest = @"
image: stefanscherer/node-windows:{0}-pure
tags: ['{1}-pure', '{2}-pure', 'pure']
manifests:
  -
    image: stefanscherer/node-windows:{0}-pure-1803
    platform:
      architecture: amd64
      os: windows
  -
    image: stefanscherer/node-windows:{0}-pure-1809
    platform:
      architecture: amd64
      os: windows
  -
    image: stefanscherer/node-windows:{0}-pure-1903
    platform:
      architecture: amd64
      os: windows
  -
    image: stefanscherer/node-windows:{0}-pure-1909
    platform:
      architecture: amd64
      os: windows
"@

  $pureManifest -f $majorMinorPatch, $majorMinor, $major | Out-File pure.yml -Encoding Ascii
  cat pure.yml
  manifest-tool push from-spec pure.yml
}

$ErrorActionPreference = 'SilentlyContinue';
npm install -g rebase-docker-image
$ErrorActionPreference = 'Stop';
choco install -y manifest-tool

#pushVersion "6.14.4" "6.14" "6"
#pushVersion "8.11.4" "8.11" "8"
#pushVersion "10.19.0" "10.19" "10"
pushVersion "12.16.1" "12.16" "12"
