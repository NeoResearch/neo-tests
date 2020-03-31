# https://github.com/neo-project/neo-node/commits/master
NEO_CLI_BLOCKCHAIN_URL=https://github.com/simplitech/neo-cli.git
NEO_CLI_BRANCH=conversion-methods
NEO_CLI_COMMIT=36daf5588b1998b704fcb655658d983f90b31e9f

# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=f46613884eaaa3ea571495e149b6e6a90ef853c5

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/bettybao1209/neo-modules.git
NEO_PLUGINS_BRANCH=add-relayreason
NEO_PLUGINS_COMMIT=007ff3e811a7ac9ef55274a2e78760cc72149e81

LOCAL_NEO_CLI_BLOCKCHAIN="false"
LOCAL_NEO_CLI_BLOCKCHAIN_URL="localfiles/neo-cli"
LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"
NEO_BLOCKCHAIN_RUN_TESTS="false"
LOCAL_NEO_PLUGINS="true"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-modules-betty"

# https://github.com/neo-project/neo-vm/commits/master
SET_NEO_VM="false"
NEO_VM_URL=https://github.com/neo-project/neo-vm.git
NEO_VM_BRANCH=master
NEO_VM_COMMIT=754bca3568c50695c571cb796c500fd66c07d0fe

LOCAL_NEO_VM="false"
LOCAL_NEO_VM_URL="localfiles/neo-vm"

PLUGINS_LIST_NEO_PACKAGE=(RpcServer RpcClient LevelDBStore RocksDBStore StatesDumper SystemLog)
PLUGINS_LIST_NO_NEO_PACKAGE=(ApplicationLogs RpcNep5Tracker)
MODULES_UT_LIST=(Neo.Network.RPC.Tests Neo.Plugins.Storage.Tests)
#RpcClient
