#!/bin/bash
#
# Build new neo-cli using new files of neo-blockchain
#

echo "Building ubuntu-dotnet dependent image"
(cd ../docker-ubuntu-dotnet; ./docker_build.sh)

CONTAINER_NAME="neo-build-neo-cli-with-new-blockchain-csharp"

echo "Delete previous .zip"
rm *.zip

echo "BUILDING neo cli with personalized characteristics..."
if [[ "$#" > 0 ]]; then
	docker build --file $1 -t $CONTAINER_NAME:latest .
else
	docker build -t $CONTAINER_NAME:latest .
fi

echo "RUNNING container $PATH_CSHARP_NODE:"
echo $CONTAINER_NAME
docker run -d --name $CONTAINER_NAME --rm -h $CONTAINER_NAME $CONTAINER_NAME

#copy neo-cli-built.zip
echo "COPYING published zip file from container..."
docker cp $CONTAINER_NAME:/opt/neo-cli-built.zip ./neo-cli-built.zip

echo "STOPPING container"
docker stop $CONTAINER_NAME
