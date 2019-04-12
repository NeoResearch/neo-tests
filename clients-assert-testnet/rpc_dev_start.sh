#!/bin/bash
source .env
./rpc_stop.sh

#Build neo cli
(cd neo-cli-dockerfile; ./docker_build.sh --neo-cli neo-cli-built-base)
(cd neo-cli-dockerfile; ./docker_build.sh --neo-cli neo-cli-built-new)

NEO_CLI_BASE_VERSION="neo-cli-built-base"
NEO_CLI_NEW_VERSION="neo-cli-built-new"

#Start docker compose detached
docker-compose up -d
