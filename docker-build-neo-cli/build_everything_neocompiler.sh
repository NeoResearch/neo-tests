#!/bin/bash
source ./.env
DISABLE_BUILD=1

while [[ "$#" > 0 ]]; do case $1 in
    -h)
        usage
        exit 0
        ;;
    --build)
	echo "PARAMETER DISABLE_BUILD desactived.";
        DISABLE_BUILD=0
        shift
        ;;
    *)
        usage
        exit 1
        ;;
  esac;
done

if ((!$DISABLE_BUILD)); then
	echo "BUILDING neo-cli with configurations of the current folder";
	./docker_build_run_copy_stop.sh
fi

# ====================================================
# Copy local neo-cli to folder
echo "Nodes path is: " + $PATH_CSHARP_NODE
rm $PATH_CSHARP_NODE/neo-cli.zip
rm $PATH_CSHARP_NODE/neo-cli-built.zip
cp ./neo-cli-built.zip $PATH_CSHARP_NODE/neo-cli-built.zip
# ====================================================

# ====================================================
# Start using --dev which invokes local neo-cli
echo "Building docker neo-csharp-nodes with specific neo-cli."
(cd $PATH_NEOCOMPILER; ./build_everything.sh --dev)
