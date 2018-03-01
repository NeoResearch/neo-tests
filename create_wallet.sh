#!/bin/bash

WALLET_PWD="coz"
CONTAINER_NAME="neo-privnet-neoresearch-integrations"

echo "Starting script to claim NEO and GAS..."
CLAIM_CMD="python3.5 /opt/neo-python/claim_neo_and_gas.py -o /tmp/wallet -p ${WALLET_PWD} -w /tmp/wif"
DOCKER_CMD="docker exec -it $CONTAINER_NAME ${CLAIM_CMD}"
echo $DOCKER_CMD
echo
($DOCKER_CMD)

#echo
#echo "Copying wallet file and wif key out of Docker container..."
#docker cp $CONTAINER_NAME:/tmp/wif ./neo-privnet.wif
#docker cp $CONTAINER_NAME:/tmp/wallet ./neo-privnet.wallet

echo
echo "--------------------"
echo
echo "All done! You now have 2 files in the $CONTAINER_NAME / folder:"
#echo "All done! You now have 2 files in the current directory:"
#echo
echo "  /tmp/wallet .. a wallet you can use with neo-python (pwd: ${WALLET_PWD})"
echo "  /tmp/wiff ..... a wif private key you can import into other clients"
echo
echo "Enjoy!"
