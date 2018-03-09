$version=$(select-string -Path Dockerfile -Pattern "ENV SWARM_VERSION").ToString().split()[-1].SubString(1)
docker run swarm:$version --help
$isVersion=$(docker run swarm:$version --version).split()[-2]
if (!($version -eq $isVersion)) {
  Write-Error "Got wrong version $isVersion, expected $version"
}
