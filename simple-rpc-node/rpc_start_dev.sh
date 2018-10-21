#!/bin/bash
#Build ubuntu-dotnet
(cd neo-cli-dockerfile/docker-ubuntu-dotnet; ./docker_build.sh)

#Build neo cli
(cd neo-cli-dockerfile; ./docker_build.sh --neo-cli neo-cli-built.zip)

#Start docker compose detached
docker-compose up -d
