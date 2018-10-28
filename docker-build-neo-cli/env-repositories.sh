NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-cli.git
NEO_CLI_BRANCH=master
NEO_CLI_COMMIT=6a875d546a9917b984dc88e64828b887de1010f8 
NEO_BLOCKCHAIN_URL=https://github.com/igormcoelho/neo.git
NEO_BLOCKCHAIN_BRANCH=new_commit_phase
NEO_BLOCKCHAIN_COMMIT=fa79898
NEO_BLOCKCHAIN_PLUGINS_URL=https://github.com/neo-project/neo-plugins.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=ada292dec3c93cd478a101937f99af84a36654b8

LOCAL_NEO_CLI_BLOCKCHAIN="false"
LOCAL_NEO_CLI_BLOCKCHAIN_URL="localfiles/neo-cli"
LOCAL_NEO_BLOCKCHAIN="true"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo-igor"
LOCAL_NEO_PLUGINS="false"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-plugins"
LOCAL_NEO_VM="false"
LOCAL_NEO_VM_URL="localfiles/neo-vm"

SET_NEO_VM="false"
NEO_VM_URL=https://github.com/neo-project/neo-vm.git
NEO_VM_BRANCH=master
NEO_VM_COMMIT=fa79898

# ./env-repositories.sh is just an example file (a workaround) to by copied with the ADD command of the dockerfile in case no local files are going to be used
if [ "$LOCAL_NEO_CLI_BLOCKCHAIN" != "true" ] ; then
    LOCAL_NEO_CLI_BLOCKCHAIN_URL="./env-repositories.sh"
fi

if [ "$LOCAL_NEO_BLOCKCHAIN" != "true" ] ; then
    LOCAL_NEO_BLOCKCHAIN_URL="./env-repositories.sh"
fi

if [ "$LOCAL_NEO_PLUGINS" != "true" ] ; then
    LOCAL_NEO_PLUGINS_URL="./env-repositories.sh"
fi

if [ "$LOCAL_NEO_VM" != "true" ] ; then
    LOCAL_NEO_VM_URL="./env-repositories.sh"
fi

ARGS="--build-arg NEO_VM_URL=$NEO_VM_URL --build-arg NEO_CLI_BLOCKCHAIN_URL=$NEO_CLI_BLOCKCHAIN_URL  --build-arg NEO_CLI_BRANCH=$NEO_CLI_BRANCH --build-arg NEO_CLI_COMMIT=$NEO_CLI_COMMIT --build-arg NEO_BLOCKCHAIN_URL=$NEO_BLOCKCHAIN_URL --build-arg NEO_BLOCKCHAIN_BRANCH=$NEO_BLOCKCHAIN_BRANCH --build-arg NEO_BLOCKCHAIN_COMMIT=$NEO_BLOCKCHAIN_COMMIT --build-arg NEO_BLOCKCHAIN_PLUGINS_URL=$NEO_BLOCKCHAIN_PLUGINS_URL --build-arg NEO_PLUGINS_BRANCH=$NEO_PLUGINS_BRANCH --build-arg NEO_PLUGINS_COMMIT=$NEO_PLUGINS_COMMIT --build-arg LOCAL_NEO_BLOCKCHAIN=$LOCAL_NEO_BLOCKCHAIN --build-arg LOCAL_NEO_BLOCKCHAIN_URL=$LOCAL_NEO_BLOCKCHAIN_URL --build-arg LOCAL_NEO_CLI_BLOCKCHAIN=$LOCAL_NEO_CLI_BLOCKCHAIN --build-arg LOCAL_NEO_CLI_BLOCKCHAIN_URL=$LOCAL_NEO_CLI_BLOCKCHAIN_URL --build-arg LOCAL_NEO_PLUGINS=$LOCAL_NEO_PLUGINS --build-arg SET_NEO_VM=$SET_NEO_VM --build-arg NEO_VM_URL=$NEO_VM_URL --build-arg NEO_VM_BRANCH=$NEO_VM_BRANCH --build-arg NEO_VM_COMMIT=$NEO_VM_COMMIT --build-arg LOCAL_NEO_VM=$LOCAL_NEO_VM --build-arg LOCAL_NEO_VM_URL=$LOCAL_NEO_VM_URL"

