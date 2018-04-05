#!/bin/bash
[[ `docker-compose --version | awk '{print $3}'` == "1.19.0," ]] && echo "docker-compose is ok: 1.19.0" || echo "ERROR: DOCKER COMPOSE VERSION SHOULD BE 1.19.0!"

echo "Ensuring that any docker-composes is down (no reestart will be possible)";
./stop-all-docker-compose.sh

echo "BUILDING/RUNNING Integration private Net with NeoScan-Docker";
(cd dockers-neo-scan-neon; ./buildRun_Compose_PrivateNet_NeoScanDocker.sh)
echo "PROCEEDING. NeoScan-Docker Built with BUILT and, probably, RUNNING. You will probably need to wait some time until NeoScan is fully sync.";
