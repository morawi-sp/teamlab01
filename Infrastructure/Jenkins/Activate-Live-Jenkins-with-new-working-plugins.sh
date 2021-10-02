#!/bin/bash

# Pull target image:(One with the matching active live Jenkins image, but eequired working plugins)

docker pull morawisp/jenkins:plgpython3

# Activate this image and connect to it via http, (from local machine):

docker run --name live-jenkins-pipeline-plugins -p 8282:8080 -p 5252:5000 morawisp/jenkins:plgpython3

# Generate password, will let you connect to the http part of this server:

echo "put id-of-docker-image to generate password, can use docker ps"
read docker-image-id
docker exec $docker-image-id cat /var/jenkins_home/secrets/initialAdminPassword

