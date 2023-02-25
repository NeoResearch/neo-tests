# https://github.com/neo-project/neo-node/commits/master
NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-node.git
NEO_CLI_BRANCH=master
NEO_CLI_COMMIT=8345b6e2fed8bf8b9d2fd71aab7ae6d7f46d39ee

# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=e786ab4efba6cea5199c487decb02a54128b1eed 

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/neo-project/neo-modules.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=d00d90b9c27b3d0c3c57e9ca1f560a09975df241

LOCAL_NEO_CLI_BLOCKCHAIN="false"
LOCAL_NEO_CLI_BLOCKCHAIN_URL="localfiles/neo-node"
LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"
LOCAL_NEO_PLUGINS="false"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-modules"

# https://github.com/neo-project/neo-vm/commits/master
SET_NEO_VM="false"
NEO_VM_URL=https://github.com/neo-project/neo-vm.git
NEO_VM_BRANCH=master
NEO_VM_COMMIT=fc0de0900d18f18a896f3aa3e2e7fe1554a9bf37

LOCAL_NEO_VM="false"
LOCAL_NEO_VM_URL="localfiles/neo-vm"

# https://github.com/neo-project/neo-modules/tree/master/src
# https://github.com/neo-project/neo-modules/tree/master/tests
# RpcNep11Tracker
PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs LevelDBStore MPTTrie OracleService RocksDBStore RpcClient RpcServer SQLiteWallet StateService StatesDumper TokensTracker DBFTPlugin)
PLUGINS_UT_LIST=(Neo.Cryptography.MPTTrie.Tests Neo.Network.RPC.Tests Neo.Plugins.OracleService.Tests  Neo.Plugins.RpcServer.Tests  Neo.Plugins.Storage.Tests)

NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
