#!/bin/bash
DOOR_CONSENSUS_DRAW=20000

echo "fuser -k on port $DOOR_CONSENSUS_DRAW"
fuser -k  $DOOR_CONSENSUS_DRAW/tcp

echo "starting appConsensusDraw.js at port $DOOR_CONSENSUS_DRAW"
node appConsensusDraw.js
