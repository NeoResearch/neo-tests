#!/bin/bash
# $1 https repo of neo to test
# $2 branch of neo repo to test

# use docker to publish neo
#TODO sub in $1 $2
echo "Building neo-publish..."
docker build --build-arg NEO_HTTPS_REPO=https://github.com/neo-project/neo.git --build-arg NEO_BRANCH=master -t neo-publish . 

CONTAINER=$(docker ps -aqf name=neo-publish)

if [ -n "$CONTAINER" ]; then
	echo "Stopping container named neo-publish"
	docker stop neo-publish 1>/dev/null
	echo "Removing container named neo-publish"
	docker rm neo-publish 1>/dev/null
fi

echo "Starting neo-publish container..."
docker run --name neo-publish neo-publish

echo "Copying published zip file from container..."
docker cp neo-publish:/opt/neo-cli.zip /opt/neo-cli.zip

echo "Cloning latest neo-privatenet-docker repo..."
#git clone https://github.com/CityOfZion/neo-privatenet-docker.git
git clone https://github.com/AshRolls/neo-privatenet-docker.git
git checkout specify_neocli

echo "Building docker privatenet with new neo-cli"
./neo-privatenet-docker/docker_build.sh /opt/neo-cli-built.zip



