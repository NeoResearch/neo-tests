#!/bin/bash
PATH_NEOCOMPILER="../../A-neocompiler-eco"
PATH_CSHARP_NODES=$PATH_NEOCOMPILER"/docker-neo-csharp-node"
echo "Nodes path is: " + $PATH_CSHARP_NODES

rm $PATH_CSHARP_NODES/neo-cli.zip
rm $PATH_CSHARP_NODES/neo-cli-built.zip
cp ./neo-cli-built.zip $PATH_CSHARP_NODES/neo-cli-built.zip

echo "Building docker neo-csharp-nodes with specific neo-cli."
(cd $PATH_NEOCOMPILER; ./build_everything.sh --dev)
