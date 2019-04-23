#!/bin/bash
echo "SLEEPING 2s before starting neo-cli";
sleep 2
echo "LAUNCHING neo-cli syncing node";
screen -L -dmS nodeRPC /opt/start_node.sh

sleep infinity
