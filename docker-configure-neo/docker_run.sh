#!/bin/bash
IMAGE_NAME="neo-opt-compiler"

# neo-core 2.7.4 ~ cae8575c29ba76709dfa3962501011390fda7c8b
# neo-cli 2.7.4: tag v2.7.4
# hexdump -v -C neo-cli.dll  > neo-cli.hex
# diff neo-cli-274/neo-cli.hex neo-cli-built/neo-cli.hex (few bytes difference)
# hexdump -v -C Neo.dll  > Neo.hex
# diff neo-cli-274/Neo.hex neo-cli-built/Neo.hex (big difference perhaps...)


NEO_BRANCH=Neo.Actor
NEO_BRANCH_COMMIT=4280a5d7ac000bc94f5df5efde2f888aaac7a9c8
NEO_CLI_BRANCH=v3.0
NEO_CLI_BRANCH_COMMIT=b4b979fdeccdf85b2daf76ff98ddcda133d3f8cd
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_BRANCH_COMMIT=095e89fb175e2b9a6c55bd0c88f7c039d2145d1c
git clone -b $NEO_CLI_BRANCH https://github.com/neo-project/neo-cli.git neo-cli && (cd neo-cli && git checkout $NEO_CLI_BRANCH_COMMIT)
git clone -b $NEO_BRANCH https://github.com/neo-project/neo.git neo-core && (cd neo-core && git checkout $NEO_BRANCH_COMMIT)
git clone -b $NEO_PLUGINS_BRANCH https://github.com/neo-project/neo-plugins.git neo-plugins && (cd neo-plugins && git checkout $NEO_PLUGINS_BRANCH_COMMIT)

echo "Starting container..."
#docker run --rm --volume neo-code:/neo-code --name $IMAGE_NAME -it /bin/bash
echo "docker run --rm --volume=`pwd`/neo-core:/opt/neo --volume=`pwd`/neo-cli:/opt/neo-cli --volume=`pwd`/neo-plugins:/opt/neo-plugins --volume=`pwd`/build:/opt/build  neo-opt-compiler -t"
docker run --rm --volume=`pwd`/neo-core:/opt/neo --volume=`pwd`/neo-cli:/opt/neo-cli --volume=`pwd`/neo-plugins:/opt/neo-plugins --volume=`pwd`/build:/opt/build  neo-opt-compiler -t
