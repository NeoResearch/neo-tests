# https://github.com/neo-project/neo-cli/commits/master
NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-node.git
NEO_CLI_BRANCH=master
NEO_CLI_COMMIT=ec426f158dbeb36b7217198b77c4af420647bcbf

# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=5252895f656f39a0381acf00e76f7bba4c084a0b

# https://github.com/neo-project/neo-plugins/commits/master
NEO_PLUGINS_URL=https://github.com/neo-project/neo-modules.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=68fbc692fb182e7225aabc3d0cf91c958607fd18

LOCAL_NEO_CLI_BLOCKCHAIN="false"
LOCAL_NEO_CLI_BLOCKCHAIN_URL="localfiles/neo-cli"
LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"
LOCAL_NEO_PLUGINS="false"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-plugins"

# https://github.com/neo-project/neo-vm/commits/master
SET_NEO_VM="false"
NEO_VM_URL=https://github.com/neo-project/neo-vm.git
NEO_VM_BRANCH=master
NEO_VM_COMMIT=bad7a007c43618a9a705ab78d942cf184ee9728d

LOCAL_NEO_VM="false"
LOCAL_NEO_VM_URL="localfiles/neo-vm"

PLUGINS_LIST=(ApplicationLogs LevelDBStore RocksDBStore RpcClient RpcNep5Tracker RpcSecurity RpcWallet StatesDumper SystemLog)
REMOVE_NEO_PACKAGE=(0 1 1 1 1 1 1 1 1)
MODULES_UT_LIST=(Neo.Network.RPC.Tests Neo.Plugins.Storage.Tests)
