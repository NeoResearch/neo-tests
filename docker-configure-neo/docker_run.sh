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
NEO_URL=https://github.com/neo-project/neo.git

NEO_CLI_BRANCH=v3.0
NEO_CLI_BRANCH_COMMIT=b4b979fdeccdf85b2daf76ff98ddcda133d3f8cd
NEO_CLI_URL=https://github.com/neo-project/neo-cli.git

NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_BRANCH_COMMIT=6f66abe005d98507e6ca06b705d820c5e8829e5c
NEO_PLUGINS_URL=https://github.com/neo-project/neo-plugins.git

NEO_VM_BRANCH=patch-3
NEO_VM_BRANCH_COMMIT=ca2d305ab33edf5262b098742097a787b7d3230a
NEO_VM_URL=https://github.com/igormcoelho/neo-vm.git

git clone -b $NEO_CLI_BRANCH $NEO_CLI_URL neo-cli && (cd neo-cli && git checkout $NEO_CLI_BRANCH_COMMIT)
git clone -b $NEO_BRANCH $NEO_URL neo-core && (cd neo-core && git checkout $NEO_BRANCH_COMMIT)
git clone -b $NEO_PLUGINS_BRANCH $NEO_PLUGINS_URL neo-plugins && (cd neo-plugins && git checkout $NEO_PLUGINS_BRANCH_COMMIT)
git clone -b $NEO_VM_BRANCH $NEO_VM_URL neo-vm && (cd neo-vm && git checkout $NEO_VM_BRANCH_COMMIT)

echo "Starting container..."
#docker run --rm --volume neo-code:/neo-code --name $IMAGE_NAME -it /bin/bash
echo "docker run --rm --volume=`pwd`/neo-core:/opt/neo --volume=`pwd`/neo-vm:/opt/neo-vm --volume=`pwd`/neo-cli:/opt/neo-cli --volume=`pwd`/neo-plugins:/opt/neo-plugins --volume=`pwd`/build:/opt/build  neo-opt-compiler -t"
docker run --rm --volume=`pwd`/neo-core:/opt/neo --volume=`pwd`/neo-vm:/opt/neo-vm --volume=`pwd`/neo-cli:/opt/neo-cli --volume=`pwd`/neo-plugins:/opt/neo-plugins --volume=`pwd`/build:/opt/build  neo-opt-compiler -t
