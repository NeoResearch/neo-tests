#!/bin/bash
source .env
./rpc_stop.sh

#Build neo cli
(cd neo-cli-dockerfile; ./docker_build.sh --neo-cli $NEO_CLI_BASE_VERSION)
(cd neo-cli-dockerfile; ./docker_build.sh --neo-cli $NEO_CLI_NEW_VERSION)

#Start docker compose detached
docker-compose up -d
