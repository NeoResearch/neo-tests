#!/bin/bash
./cn_stop.sh

#Build neo cli
./docker_build.sh

#Start docker compose detached
docker compose up -d
