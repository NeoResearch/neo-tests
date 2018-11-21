#!/bin/bash
IMAGE_NAME="neo-opt-compiler"

# neo-core 2.7.4 ~ cae8575c29ba76709dfa3962501011390fda7c8b
# neo-cli 2.7.4: tag v2.7.4
# hexdump -v -C neo-cli.dll  > neo-cli.hex
# diff neo-cli-274/neo-cli.hex neo-cli-built/neo-cli.hex (few bytes difference)
# hexdump -v -C Neo.dll  > Neo.hex
# diff neo-cli-274/Neo.hex neo-cli-built/Neo.hex (big difference perhaps...)


NEO_BRANCH=patch-5
NEO_BRANCH_COMMIT=9b9daba51eba846e1cf8ef94d1f0e51b2d5e7d1a
NEO_URL=https://github.com/igormcoelho/neo.git

NEO_CLI_BRANCH=master
NEO_CLI_BRANCH_COMMIT=899f2a963be7fdda1eeec5cdbf049a630ad9ceea
NEO_CLI_URL=https://github.com/neo-project/neo-cli.git

NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_BRANCH_COMMIT=e9e97ba3aee5f857a422bc43e907d1cfefc9ade6
NEO_PLUGINS_URL=https://github.com/neo-project/neo-plugins.git

NEO_VM_BRANCH=master
NEO_VM_BRANCH_COMMIT=76cf461f0814bdd067cc0d0947cede05f8a0ff91
NEO_VM_URL=https://github.com/neo-project/neo-vm.git

echo "git clone -b $NEO_CLI_BRANCH $NEO_CLI_URL neo-cli"
git clone -b $NEO_CLI_BRANCH $NEO_CLI_URL neo-cli
echo "(cd neo-cli && git pull origin $NEO_CLI_BRANCH  && git checkout $NEO_CLI_BRANCH_COMMIT)"
(cd neo-cli && git pull origin $NEO_CLI_BRANCH  && git checkout $NEO_CLI_BRANCH_COMMIT)

echo "git clone -b $NEO_BRANCH $NEO_URL neo-core"
#git clone -b $NEO_BRANCH $NEO_URL neo-core
echo "(cd neo-core && git pull origin $NEO_BRANCH && git checkout $NEO_BRANCH_COMMIT)"
#(cd neo-core && git pull origin $NEO_BRANCH && git checkout $NEO_BRANCH_COMMIT)

echo "git clone -b $NEO_PLUGINS_BRANCH $NEO_PLUGINS_URL neo-plugins"
git clone -b $NEO_PLUGINS_BRANCH $NEO_PLUGINS_URL neo-plugins
echo "(cd neo-plugins && git pull origin $NEO_PLUGINS_BRANCH && git checkout $NEO_PLUGINS_BRANCH_COMMIT)"
(cd neo-plugins && git pull origin $NEO_PLUGINS_BRANCH && git checkout $NEO_PLUGINS_BRANCH_COMMIT)

echo "git clone -b $NEO_VM_BRANCH $NEO_VM_URL neo-vm"
git clone -b $NEO_VM_BRANCH $NEO_VM_URL neo-vm
echo "(cd neo-vm && git pull origin $NEO_VM_BRANCH && git checkout $NEO_VM_BRANCH_COMMIT)"
(cd neo-vm && git pull origin $NEO_VM_BRANCH && git checkout $NEO_VM_BRANCH_COMMIT)

echo "Starting container..."
#docker run --rm --volume neo-code:/neo-code --name $IMAGE_NAME -it /bin/bash
echo "docker run --rm --volume=`pwd`/neo-core:/opt/neo --volume=`pwd`/neo-vm:/opt/neo-vm --volume=`pwd`/neo-cli:/opt/neo-cli --volume=`pwd`/neo-plugins:/opt/neo-plugins --volume=`pwd`/build:/opt/build  neo-opt-compiler -t"
docker run --rm --volume=`pwd`/neo-core:/opt/neo --volume=`pwd`/neo-vm:/opt/neo-vm --volume=`pwd`/neo-cli:/opt/neo-cli --volume=`pwd`/neo-plugins:/opt/neo-plugins --volume=`pwd`/build:/opt/build  neo-opt-compiler -t
