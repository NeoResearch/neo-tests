#!/bin/bash
#
# This script starts a NEOX node


node="/root/nodes/node"

mkdir -p $node

#geth --datadir $node account new --password /opt/password.txt

#genesis_mainnet.json
geth init --datadir $node /root/genesis_testnet.json

#echo "LAUNCHING NeoX...";
#screen -L -dmS node /opt/startNode.sh

sleep infinity
