#!/bin/bash
DOOR_STATE_SNAPSHOT=12000

echo "fuser -k on port $DOOR_STATE_SNAPSHOT"
fuser -k  $DOOR_STATE_SNAPSHOT/tcp

echo "starting appStorageSnapshot.js at port $DOOR_STATE_SNAPSHOT"
node appStateSnapshot.js
