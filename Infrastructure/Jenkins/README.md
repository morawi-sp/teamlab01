# This is simple system to create a test scenario, for validate Jenkins plugins. 
The base of this system are the two containers based upon the two Jenkins containers. created by two bash scripts that are attached to this folder.


File-Name:"Activate-Live-Jenkins-with-new-working-plugins.sh"
```
#!/bin/bash

# Pull target image:(One with the matching active live Jenkins image, but eequired working plugins)

docker pull morawisp/jenkins:2.204.2-jdk-11-only-working-plugins

# Activate this image and connect to it via http, (from local machine):

docker run --name live-jenkins-pipeline-plugins -p 8181:8080 -p 5151:5000 morawisp/jenkins:2.204.2-jdk-11-only-working-plugins

# Generate password, will let you connect to the http part of this server:

echo "put id-of-docker-image to generate password, can use docker ps"
read docker-image-id
docker exec $docker-image-id cat /var/jenkins_home/secrets/initialAdminPas

```

File-Name:"Activate-latest-Jenkins-Python3-All-needed-plugins.sh"
```
#!/bin/bash

# Pull target image:(One with the matching active live Jenkins image, but eequired working plugins)

docker pull morawisp/jenkins:plgpython3

# Activate this image and connect to it via http, (from local machine):

docker run --name live-jenkins-pipeline-plugins -p 8282:8080 -p 5252:5000 morawisp/jenkins:plgpython3

# Generate password, will let you connect to the http part of this server:

echo "put id-of-docker-image to generate password, can use docker ps"
read docker-image-id
docker exec $docker-image-id cat /var/jenkins_home/secrets/initialAdminPassword

```
