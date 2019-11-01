#!/usr/bin/env bash
source ./.env
echo "Going to path $PATH_NEOCOMPILER"
(cd $PATH_NEOCOMPILER; ./stopEco_network.sh --stop-express)
