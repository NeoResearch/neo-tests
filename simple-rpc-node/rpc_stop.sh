#!/bin/bash
source .env
docker compose down

if (($DELETE_STORAGE_CHAIN)); then
	echo "Deleting chain, applog, as well as storage."
	./deleteStorageAndChain.sh
fi
