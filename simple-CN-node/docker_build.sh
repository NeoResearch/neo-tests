#!/bin/bash
set -e

NEO_CLI_VERSION="3.8.2"

BASE_NAME="eco-neo-csharp-node-simple-cn"
IMAGE_NAME="$BASE_NAME:$NEO_CLI_VERSION"

echo "docker build no cache"

docker build -t $IMAGE_NAME .

echo "docker tag $IMAGE_NAME $BASE_NAME:latest"

docker tag $IMAGE_NAME "$BASE_NAME:latest"
