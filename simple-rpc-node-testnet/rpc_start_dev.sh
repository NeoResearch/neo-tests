#!/bin/bash
./rpc_stop.sh

#Build neo cli
(cd neo-cli-dockerfile; ./docker_build.sh --neo-cli neo-cli-built.zip)

#Start docker compose detached
docker-compose up -d
