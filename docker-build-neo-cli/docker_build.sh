#!/bin/bash
#
# Build new neo-cli using new files of neo-blockchain
#

CONTAINER_NAME="neo-build-neo-cli-with-new-blockchain-csharp"

echo "BUILDING neo cli with personalized characteristics..."

if [[ "$#" > 0 ]]; then
	docker build -t  -f "#1" $CONTAINER_NAME:latest .
else
	docker build -t  $CONTAINER_NAME:latest .
fi
