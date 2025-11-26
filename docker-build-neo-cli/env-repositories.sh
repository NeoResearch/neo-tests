# https://github.com/neo-project/neo-node/commits/master
NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-node.git
NEO_CLI_BRANCH=master
NEO_CLI_COMMIT=a511881b9bcafd5402e284318fcdf839fe8f6a95


# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=56444b3ff1bf1f8e0f99daaea021e5c5eac75d2d

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_PATH="localfiles/neo"
LOCAL_NEO_CLI_BLOCKCHAIN="false"
LOCAL_NEO_CLI_BLOCKCHAIN_PATH="localfiles/neo-node"

# ========= INJECT SPECIFIC NEO-VM =========
# https://github.com/neo-project/neo-vm/commits/master
NEO_VM_URL=https://github.com/neo-project/neo-vm.git
NEO_VM_BRANCH=49f87f8ba5403719133c1bc59cba5a1d85ae729a
NEO_VM_COMMIT=7e5996844a90b514739f879bc9f873f9a34c9a67

# If Set to  True it will download from github, otherwise it will not
SET_NEO_VM="false"
# INJECT LOCAL NEO-VM
LOCAL_NEO_VM="false"
LOCAL_NEO_VM_PATH="localfiles/neo-vm"
# ========= INJECT SPECIFIC NEO-VM =========


PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore OracleService RestServer RocksDBStore RpcServer SQLiteWallet SignClient StateService StorageDumper TokensTracker)
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
