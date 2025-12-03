# https://github.com/neo-project/neo-node/commits/master-n3
NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-node.git
NEO_CLI_BRANCH=master-n3
NEO_CLI_COMMIT=419c3f1d8ab8ab18bd702518b5590e6f9acfd2c4

# https://github.com/neo-project/neo/commits/master-n3
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master-n3
NEO_BLOCKCHAIN_COMMIT=004c97efd6629bef2feb48d72678d73cde114644

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_PATH="localfiles/neo"
LOCAL_NEO_CLI_BLOCKCHAIN="false"
LOCAL_NEO_CLI_BLOCKCHAIN_PATH="localfiles/neo-node"

# ========= INJECT SPECIFIC NEO-VM =========
# https://github.com/neo-project/neo-vm/commits/master
NEO_VM_URL=https://github.com/neo-project/neo-vm.git
NEO_VM_BRANCH=master
NEO_VM_COMMIT=49f87f8ba5403719133c1bc59cba5a1d85ae729a

# If Set to  True it will download from github, otherwise it will not
SET_NEO_VM="false"
# INJECT LOCAL NEO-VM
LOCAL_NEO_VM="false"
LOCAL_NEO_VM_PATH="localfiles/neo-vm"
# ========= INJECT SPECIFIC NEO-VM =========


PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore MPTTrie OracleService RestServer RocksDBStore RpcClient RpcServer SQLiteWallet SignClient StateService StorageDumper TokensTracker)
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
