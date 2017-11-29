#!/bin/bash
# $1 https repo of neo to test
# $2 branch of neo repo to test

# use docker to publish neo
#TODO sub in $1 $2

CONTAINER=$(docker ps -aqf name=neo-publish)
if [ -n "$CONTAINER" ]; then
	echo "Stopping container named neo-publish"
	docker stop neo-publish 1>/dev/null
	echo "Removing container named neo-publish"
	docker rm neo-publish 1>/dev/null
fi

echo "Building & running neo-publish..."
docker rmi neo-publish
docker build --no-cache --build-arg NEO_HTTPS_REPO=https://github.com/neo-project/neo.git --build-arg NEO_BRANCH=master -t neo-publish . 
docker run --name neo-publish neo-publish

echo "Copying published zip file from container..."
docker cp neo-publish:/opt/neo-cli-built.zip /opt/neo-cli.zip

echo "Removing existing privatenet files and images..."
rm -rf ./neo-privatenet-docker
CONTAINER=$(docker ps -aqf name=neo-privnet)
if [ -n "$CONTAINER" ]; then
	echo "Stopping container named neo-privnet"
	docker stop neo-privnet 1>/dev/null
	echo "Removing container named neo-privnet"
	docker rm neo-privnet 1>/dev/null
fi
docker rmi neo-privnet

echo "Cloning latest neo-privatenet-docker repo..."
#git clone https://github.com/CityOfZion/neo-privatenet-docker.git
git clone https://github.com/AshRolls/neo-privatenet-docker.git
cd neo-privatenet-docker/
git checkout specify_neocli

echo "Building docker privatenet with new neo-cli..."
./docker_build.sh /opt/neo-cli-built.zip

echo "Running Privatenet and claiming GAS..."
./docker_run_and_create_wallet.sh


