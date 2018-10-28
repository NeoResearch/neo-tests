#!/bin/bash
#
# Build new neo-cli using new files of neo-blockchain
#
source ./env-repositories.sh

ARGS="--build-arg NEO_VM_URL=$NEO_VM_URL --build-arg NEO_CLI_BLOCKCHAIN_URL=$NEO_CLI_BLOCKCHAIN_URL  --build-arg NEO_CLI_BRANCH=$NEO_CLI_BRANCH --build-arg NEO_CLI_COMMIT=$NEO_CLI_COMMIT --build-arg NEO_BLOCKCHAIN_URL=$NEO_BLOCKCHAIN_URL --build-arg NEO_BLOCKCHAIN_BRANCH=$NEO_BLOCKCHAIN_BRANCH --build-arg NEO_BLOCKCHAIN_COMMIT=$NEO_BLOCKCHAIN_COMMIT --build-arg NEO_BLOCKCHAIN_PLUGINS_URL=$NEO_BLOCKCHAIN_PLUGINS_URL --build-arg NEO_PLUGINS_BRANCH=$NEO_PLUGINS_BRANCH --build-arg NEO_PLUGINS_COMMIT=$NEO_PLUGINS_COMMIT --build-arg LOCAL_NEO_BLOCKCHAIN=$LOCAL_NEO_BLOCKCHAIN --build-arg LOCAL_NEO_BLOCKCHAIN_URL=$LOCAL_NEO_BLOCKCHAIN_URL --build-arg LOCAL_NEO_CLI_BLOCKCHAIN=$LOCAL_NEO_CLI_BLOCKCHAIN --build-arg LOCAL_NEO_CLI_BLOCKCHAIN_URL=$LOCAL_NEO_CLI_BLOCKCHAIN_URL --build-arg LOCAL_NEO_PLUGINS=$LOCAL_NEO_PLUGINS --build-arg LOCAL_NEO_PLUGINS_URL=$LOCAL_NEO_PLUGINS_URL"

echo "Building ARGS are: $ARGS"

echo "Building ubuntu-dotnet dependent image"
(cd ../docker-ubuntu-dotnet; ./docker_build.sh)

CONTAINER_NAME="neo-build-neo-cli-with-new-blockchain-csharp"

echo "Delete previous .zip"
rm *.zip

echo "BUILDING neo cli with personalized characteristics..."
if [[ "$#" > 0 ]]; then
	docker build $ARGS --file $1 -t $CONTAINER_NAME:latest .
else
	docker build $ARGS -t $CONTAINER_NAME:latest .
fi

echo "RUNNING container $PATH_CSHARP_NODE:"
echo $CONTAINER_NAME
docker run -d --name $CONTAINER_NAME --rm -h $CONTAINER_NAME $CONTAINER_NAME

#copy neo-cli-built.zip
echo "COPYING published zip file from container..."
docker cp $CONTAINER_NAME:/opt/neo-cli-built.zip ./neo-cli-built.zip

echo "STOPPING container"
docker stop $CONTAINER_NAME
