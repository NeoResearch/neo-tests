# https://github.com/neo-project/neo-node/commits/master
NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-node.git
NEO_CLI_BRANCH=master
NEO_CLI_COMMIT=5d531a44880f9cced21f1a72534c07294c1913a2

# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=be19ab86cb2d372cfa0f40876e2b6ac4dc132952 

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/neo-project/neo-modules.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=2aac8693fcdd2054b26a91d6bbc1c7d4a5c6481c

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
PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore OracleService RocksDBStore RpcClient RpcNep17Tracker RpcServer StateService StatesDumper)
PLUGINS_UT_LIST=(Neo.Network.RPC.Tests Neo.Plugins.OracleService.Tests  Neo.Plugins.RpcServer.Tests  Neo.Plugins.StateService.Tests Neo.Plugins.Storage.Tests)

NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
