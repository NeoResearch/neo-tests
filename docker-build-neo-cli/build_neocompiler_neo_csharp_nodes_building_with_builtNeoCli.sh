#!/bin/bash
PATH_CSHARP_NODES="../../A-neocompiler-eco/docker-neo-csharp-nodes/"

rm $PATH_CSHARP_NODES/neo-cli.zip
rm $PATH_CSHARP_NODES/neo-cli-built.zip
cp ./neo-cli-built.zip $PATH_CSHARP_NODES

echo "Building docker neo-csharp-nodes with specific neo-cli."
(cd $PATH_CSHARP_NODES/; ./docker_build.sh --neo-cli ./neo-cli-built.zip)
