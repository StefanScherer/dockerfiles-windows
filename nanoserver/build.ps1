$image="mcr.microsoft.com/windows/nanoserver:1809"

Function PullTagPush($image, $tag) {
  docker pull "$image:$tag"
  $osversion=$(docker image inspect "$image:$tag" | jq -r '.[0].OsVersion')
  docker tag "$image:$tag" "stefanscherer/nanoserver:$tag"
  docker tag "$image:$tag" "stefanscherer/nanoserver:$osversion"
}

PullTagPush($image, "1809")
PullTagPush($image, "1803")
