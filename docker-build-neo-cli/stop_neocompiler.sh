#!/usr/bin/env bash
source ./.env
echo "Going to path $PATH_NEOCOMPILER"
(cd $PATH_NEOCOMPILER; ./stop_everything.sh)
