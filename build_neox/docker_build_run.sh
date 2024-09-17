#!/bin/bash
DOCKERFILE="./Dockerfile"

echo "BUILDING bane"
docker build -t banelabs-go-ethereum:latest -f $DOCKERFILE --progress=plain .

