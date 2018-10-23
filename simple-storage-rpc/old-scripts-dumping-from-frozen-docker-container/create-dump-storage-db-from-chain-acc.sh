#!/bin/bash
CSHARP_NEOCLI_CONTAINER="eco-neo-csharp-noderpc-mainnet-testnet"

firstBlockHeight=0
desiredSnapshotIncrement=1
nextHeight=$(($firstBlockHeight+$desiredSnapshotIncrement))

echo "Ensuring everything is down"
(cd ./simple-history-rpc-node; docker-compose down)

echo "Deleting simple-history-rpc-node"
rm -r ./simple-history-rpc-node

echo "Copying simple-rpc-node"
cp -r ../simple-rpc-node/ ./simple-history-rpc-node

sed -i '/DISABLE_NETWORK_P2P/c\      DISABLE_NETWORK_P2P: '1'' ./simple-history-rpc-node/docker-compose.yml
sed -i '/Chain:/a\      - ./Storage:/opt/node/neo-cli/Storage' ./simple-history-rpc-node/docker-compose.yml
mkdir ./simple-history-rpc-node/Storage

echo "Start DB at next height equal to $nextHeight"
sed -i '/MaxOnImportHeight/c\\t"MaxOnImportHeight": '$nextHeight'' ./simple-history-rpc-node/neo-cli/configs/plugins/importBlocks.json

echo "Ensure that chain is empty"
sudo rm ./simple-history-rpc-node/Chain/*

echo "Building last version and starting docker-compose with csharp RPC storage node"
(cd ../simple-rpc-node/neo-cli-dockerfile; ./docker_build.sh)
(cd ./simple-history-rpc-node; docker-compose up -d)

sleep 3

while true; do
	echo "Exporting from screen nodeRPC-$nextHeight"
	docker exec -it  $CSHARP_NEOCLI_CONTAINER screen -S nodeRPC -p 0 -X stuff "dump storage^M"
	sleep 5
	echo "Exiting from screen $nextHeight"
	docker exec -it  $CSHARP_NEOCLI_CONTAINER screen -S nodeRPC -p 0 -X stuff "exit^M"
	sleep 5

	#Kill screen
	#docker exec -it  $CSHARP_NEOCLI_CONTAINER screen -X -S nodeRPC quit
	#docker exec -it  $CSHARP_NEOCLI_CONTAINER screen -wipe 
	#sleep 1

	docker exec -it  $CSHARP_NEOCLI_CONTAINER mv /opt/node/neo-cli/dump.json ./opt/node/neo-cli/Storage/dump.$nextHeight.json

	#Modify height
	nextHeight=$(($nextHeight+$desiredSnapshotIncrement))
#	docker exec -it  $CSHARP_NEOCLI_CONTAINER sed -i '/MaxOnImportHeight/c\\t"MaxOnImportHeight": '$nextHeight'' /opt/node$i/neo-cli/Plugins/ImportBlocks/config.json
sed -i '/MaxOnImportHeight/c\\t"MaxOnImportHeight": '$nextHeight'' ./simple-history-rpc-node/neo-cli/configs/plugins/importBlocks.json
	echo "Next block image block is height $nextHeight "

	#Start screen again with modified new height
	docker exec -it  $CSHARP_NEOCLI_CONTAINER screen -L -dmS nodeRPC-$nextHeight /opt/start_node.sh
	sleep 2
done 
