#!/bin/bash
#
# Build new neo-privanet using new neo-cli build with docker
#

CONTAINER_NAME="neo-privnet-neoresearch-integrations"
docker build --no-cache -t $CONTAINER_NAME .
