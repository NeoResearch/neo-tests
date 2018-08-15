#!/bin/bash
PATH_CSHARP_NODE="../../A-neocompiler-eco/docker-neo-csharp-node"

rm $PATH_CSHARP_NODE/neo-cli.zip
rm $PATH_CSHARP_NODE/neo-cli-built.zip
cp ./neo-cli-built.zip $PATH_CSHARP_NODE/neo-cli-built.zip

echo "Building docker neo-csharp-node with specific neo-cli."
(cd $PATH_CSHARP_NODE; ./docker_build.sh --neo-cli ./neo-cli-built.zip)
