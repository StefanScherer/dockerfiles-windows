$image="mcr.microsoft.com/windows/nanoserver"

Function Push($image, $tag) {
  $osversion=$(docker image inspect "${image}:${tag}" | jq -r '.[0].OsVersion')
  echo "Pushing stefanscherer/nanoserver:$tag"
  docker push "stefanscherer/nanoserver:$tag"
  echo "Pushing stefanscherer/nanoserver:$osversion"
  docker push "stefanscherer/nanoserver:$osversion"
}

Push $image "1809"
Push $image "1803"
