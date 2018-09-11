#!/bin/bash

ADDRESS_TO_QUERY="http://localhost:10332"
CONTAINER_TO_SNAPSHOT="eco-neo-csharp-noderpc-mainnet-testnet"
VERSION="3.0-preview10-appLog"

while [[ $blockHeight -eq -1 ]]; do
    blockCountJson=`curl -s -X POST $ADDRESS_TO_QUERY -H 'Content-Type: application/json' -d '{ "jsonrpc": "2.0", "id": 5, "method": "getblockcount", "params": [] }'`
    echo $blockCountJson
    blockHeight=${blockCountJson%'}'*}  # retain the part before the colon
    blockHeight=${blockHeight##*result'"':}  # retain the part after the last slash
    echo $blockHeight
    sleep 1
done

echo "We are starting at height $blockHeight "

blockHeight=0
desiredSnapshotIncrement=1
nextHeight=$(($blockHeight+$desiredSnapshotIncrement-1))
echo "Next block image block is height $nextHeight "

while true; do
    blockCountJson=`curl -s -X POST $ADDRESS_TO_QUERY -H 'Content-Type: application/json' -d '{ "jsonrpc": "2.0", "id": 5, "method": "getblockcount", "params": [] }'`
    echo $blockCountJson
    blockHeight=${blockCountJson%'}'*}  # retain the part before the colon
    blockHeight=${blockHeight##*result'"':}  # retain the part after the last slash
    echo $blockHeight

    if [ \( $blockHeight -gt $nextHeight \) ]; then
        echo "Time to Snapshot... $CONTAINER_TO_SNAPSHOT at block height $blockHeight"
	docker exec -it  $CONTAINER_TO_SNAPSHOT screen -S node -p 0 -X stuff "dump storage^M"
	docker cp $CONTAINER_TO_SNAPSHOT:/opt/node/neo-cli/dump.json ./
	docker rm $CONTAINER_TO_SNAPSHOT:/opt/node/neo-cli/dump.json ./

	#Kill screen
	docker exec -it  $CONTAINER_TO_SNAPSHOT screen -X -S node quit  

	#Modify height
	docker exec -it  $CONTAINER_TO_SNAPSHOT sed -i '/SecondsPerBlock/c\\t"SecondsPerBlock": '$1',' /opt/node$i/neo-cli/Plugins/protocol.json


	#Start screen again with modified new height
	docker exec -it  $CONTAINER_TO_SNAPSHOT /opt/run.sh
	
	nextHeight=$(($blockHeight+$desiredSnapshotIncrement))
	echo "Next block image block is height $nextHeight "
#	sleep 2
    fi
    
 #   sleep 1
done 
