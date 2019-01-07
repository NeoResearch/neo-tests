#!/bin/bash
#Build neo cli
(cd neo-cli-dockerfile; ./docker_build.sh)

#Start docker compose detached
docker-compose up -d
