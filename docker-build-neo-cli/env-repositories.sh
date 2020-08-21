# https://github.com/neo-project/neo-node/commits/master
NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-node.git
NEO_CLI_BRANCH=master
NEO_CLI_COMMIT=50324a1c5075ce71d55bca63ed78d43f8a6f6433

# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=35eea42a99eafc26dfec2ab2a682cbb15e976352

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/neo-project/neo-modules.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=c465029d2f80145416fe7a1ea67382857d04ffcc

LOCAL_NEO_CLI_BLOCKCHAIN="false"
LOCAL_NEO_CLI_BLOCKCHAIN_URL="localfiles/neo-cli"
LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"
LOCAL_NEO_PLUGINS="false"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-modules"

# https://github.com/neo-project/neo-vm/commits/master
SET_NEO_VM="false"
NEO_VM_URL=https://github.com/neo-project/neo-vm.git
NEO_VM_BRANCH=master
NEO_VM_COMMIT=e3f1584b1953dcc13075a57803240858c8a480de

LOCAL_NEO_VM="false"
LOCAL_NEO_VM_URL="localfiles/neo-vm"

# https://github.com/neo-project/neo-modules/tree/master/src
# https://github.com/neo-project/neo-modules/tree/master/tests
# RpcClient
PLUGINS_LIST_NEO_PACKAGE=(LevelDBStore RocksDBStore RpcServer StatesDumper)
PLUGINS_LIST_NO_NEO_PACKAGE=(ApplicationLogs RpcNep5Tracker)
PLUGINS_UT_LIST=(Neo.Network.RPC.Tests Neo.Plugins.Storage.Tests)

NEO_BLOCKCHAIN_RUN_TESTS="false"
PLUGINS_RUN_TESTS="false"
