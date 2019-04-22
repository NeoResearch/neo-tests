#!/bin/bash
echo "LAUNCHING neo-cli syncing node";
screen -L -dmS nodeRPC /opt/start_node.sh

sleep infinity
