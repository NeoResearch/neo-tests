#!/bin/bash
echo "Deleting Eco logs..."

PATH_NEOCOMPILER_ECO="../../neocompiler-eco"

rm -r $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs*
