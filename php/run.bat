docker rm -f phpdemo
docker run -d --name phpdemo -p 80:80 php
echo "Web server running at:"
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" phpdemo