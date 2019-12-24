# https://github.com/neo-project/neo-cli/commits/master
NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-node.git
NEO_CLI_BRANCH=master
NEO_CLI_COMMIT=0b439ab2354f09ff67c4aa24093c896e4b0b4ae8

# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=44e7f3b715aedcef10f2cfb369ccca3ee0a5bcd2

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/neo-project/neo-modules.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=c08ce9017ea62ef59ec69136005d40fda642537b

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
NEO_VM_COMMIT=c08e853d1314c596575043c47b2b6a72b70ce305

LOCAL_NEO_VM="false"
LOCAL_NEO_VM_URL="localfiles/neo-vm"

PLUGINS_LIST_NEO_PACKAGE=(LevelDBStore RocksDBStore RpcClient RpcServer StatesDumper SystemLog)
PLUGINS_LIST_NO_NEO_PACKAGE=(ApplicationLogs RpcNep5Tracker)
MODULES_UT_LIST=(Neo.Network.RPC.Tests Neo.Plugins.Storage.Tests)
