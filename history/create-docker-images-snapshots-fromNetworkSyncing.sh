#!/bin/bash

blockHeight=-1
#ADDRESS_TO_QUERY="http://178.128.203.47:10332"
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

desiredSnapshotIncrement=3
nextHeight=$(($blockHeight+$desiredSnapshotIncrement-1))
echo "Next block image block is height $nextHeight "

while true; do
    blockCountJson=`curl -s -X POST $ADDRESS_TO_QUERY -H 'Content-Type: application/json' -d '{ "jsonrpc": "2.0", "id": 5, "method": "getblockcount", "params": [] }'`
    echo $blockCountJson
    blockHeight=${blockCountJson%'}'*}  # retain the part before the colon
    blockHeight=${blockHeight##*result'"':}  # retain the part after the last slash
    echo $blockHeight

    if [ \( $blockHeight -gt $nextHeight \) ]; then
        echo "Time to Snapshot... $CONTAINER_TO_SNAPSHOT as $CONTAINER_TO_SNAPSHOT-$blockHeight"

	#Example
        #docker exec -it  $CONTAINER_TO_SNAPSHOT screen -S node -p 0 -X stuff "help^M"
# This rm is import and not working =/
#	docker exec -it  $CONTAINER_TO_SNAPSHOT rm -f /opt/node/neo-cli/chain.*
	docker exec -it  $CONTAINER_TO_SNAPSHOT screen -S node -p 0 -X stuff "export blocks $(($nextHeight-$desiredSnapshotIncrement)) $desiredSnapshotIncrement^M"


        docker stop $CONTAINER_TO_SNAPSHOT
	docker commit $CONTAINER_TO_SNAPSHOT $CONTAINER_TO_SNAPSHOT-$blockHeight:$VERSION
        docker start $CONTAINER_TO_SNAPSHOT

	nextHeight=$(($blockHeight+3))
	echo "Next block image block is height $nextHeight "
	sleep 2
    fi
    
    sleep 1
done 
