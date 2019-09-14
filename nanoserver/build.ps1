choco install -y jq

$image="mcr.microsoft.com/windows/nanoserver"

Function PullTagPush($image, $tag) {
  Write-Output "Pulling ${image}:${tag}"
  docker pull "${image}:${tag}"
  $osversion=$(docker image inspect "${image}:${tag}" | jq -r '.[0].OsVersion')
  docker tag "${image}:${tag}" "stefanscherer/nanoserver:$tag"
  docker tag "${image}:${tag}" "stefanscherer/nanoserver:$osversion"
}

PullTagPush $image "1809"
PullTagPush $image "1803"
