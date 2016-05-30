docker build -t hello-express -f Dockerfile.core .
docker build --isolation=hyperv -t hello-express:nano -f Dockerfile.nano .
