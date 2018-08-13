#!/bin/bash
# assuming neocompiler-eco and neo-opt-tests are in same hierarchy (TODO: use ENV to control this)
rm -f ../../neocompiler-eco/docker-neo-csharp-node/neo-cli-built.zip
rm -f ../../neocompiler-eco/docker-neo-csharp-node/neo-cli.zip

cp ./build/neo-cli-built.zip ../../neocompiler-eco/docker-neo-csharp-node/

(cd ../../neocompiler-eco/docker-neo-csharp-node/ && ./docker_build.sh --neo-cli ./neo-cli-built.zip)

echo "finished! must rebuild Eco network now, usually with command: ./build_everything.sh --no-build"
