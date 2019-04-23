#!/bin/bash
source .env
docker-compose down

if (($DELETE_STORAGE_CHAIN)); then
	echo "Deleting chain base and new, as well as storage."
	./deleteStorageAndChain.sh
fi
