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
