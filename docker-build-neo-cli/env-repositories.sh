# https://github.com/neo-project/neo-node/commits/master
NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-node.git
NEO_CLI_BRANCH=master
NEO_CLI_COMMIT=90c7f396df2ac52c4ced880c433d286719e578ce

# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=5d5bd0222a4d2f10cf90f3b9b72386ae77ca750f

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/neo-project/neo-modules.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=3ab2871ab30a90e6dcb2b14ff2e59631f40fa59f

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
NEO_VM_COMMIT=a14b934f5b5c8779164e3b96b276984b3a57ccd4

LOCAL_NEO_VM="false"
LOCAL_NEO_VM_URL="localfiles/neo-vm"

# https://github.com/neo-project/neo-modules/tree/master/src
# https://github.com/neo-project/neo-modules/tree/master/tests
# RpcClient
PLUGINS_LIST_NEO_PACKAGE=(LevelDBStore RocksDBStore RpcServer StatesDumper)
PLUGINS_LIST_NO_NEO_PACKAGE=(ApplicationLogs RpcNep5Tracker)
PLUGINS_UT_LIST=(Neo.Network.RPC.Tests Neo.Plugins.Storage.Tests)

NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="false"
