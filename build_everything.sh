#!/bin/bash
[[ `docker-compose --version | awk '{print $3}'` == "1.19.0," ]] && echo "docker-compose is ok: 1.19.0" || echo "ERROR: DOCKER COMPOSE VERSION SHOULD BE 1.19.0!"

if [ $# -eq 0 ] 
   then
	echo "BUILDING a new neo-cli and COMMITING a new private net with it";
	./commit_modified_privatenet.sh
fi

echo "ENSURING that any docker-composes is down (no reestart will be possible)";
./stop-all-docker-compose.sh

echo "BUILDING/RUNNING neo-scan + opt private Net";
(cd dockers-neo-scan-neon; ./buildRun_Compose_PrivateNet_NeoScanDocker.sh)

echo "Docker-compose BUILT and, probably, neo-scan is RUNNING. You will probably need to wait some time until NeoScan is fully sync.";
