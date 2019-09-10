$fossa_version=$(select-string -Path Dockerfile -Pattern "ENV FOSSA_VERSION").ToString().split()[-1]
$node_version=$(select-string -Path Dockerfile -Pattern "ARG NODE_VERSION").ToString().split()[-1]
docker tag "fossa-node" "stefanscherer/fossa-node-windows:$fossa_version-$node_version"
docker push "stefanscherer/fossa-node-windows:$fossa_version-$node_version"
docker tag "fossa-node" "stefanscherer/fossa-node-windows:latest"
docker push "stefanscherer/fossa-node-windows:latest"
