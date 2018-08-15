#!/bin/bash
PATH_NEOCOMPILER="../../A-neocompiler-eco"
PATH_CSHARP_NODE=$PATH_NEOCOMPILER"/docker-neo-csharp-node"
echo "Nodes path is: " + $PATH_CSHARP_NODE

rm $PATH_CSHARP_NODE/neo-cli.zip
rm $PATH_CSHARP_NODE/neo-cli-built.zip
cp ./neo-cli-built.zip $PATH_CSHARP_NODE/neo-cli-built.zip

echo "Building docker neo-csharp-nodes with specific neo-cli."
(cd $PATH_NEOCOMPILER; ./build_everything.sh --dev)
