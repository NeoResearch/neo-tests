# https://github.com/neo-project/neo-node/commits/master-n3
NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-node.git
NEO_CLI_BRANCH=master-n3
NEO_CLI_COMMIT=203f37b0c2fd4856208aac60408edd45a1de9e88

# https://github.com/neo-project/neo/commits/master-n3
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master-n3
NEO_BLOCKCHAIN_COMMIT=df4026753787c93adf978a94dc63685cf54d2c82

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_PATH="localfiles/neo"
LOCAL_NEO_CLI_BLOCKCHAIN="false"
LOCAL_NEO_CLI_BLOCKCHAIN_PATH="localfiles/neo-node"

# ========= INJECT SPECIFIC NEO-VM =========
# https://github.com/neo-project/neo-vm/commits/master
NEO_VM_URL=https://github.com/neo-project/neo-vm.git
NEO_VM_BRANCH=master
NEO_VM_COMMIT=027baadb73dd894755250f63158bcbbdd8fcac33

# If Set to  True it will download from github, otherwise it will not
SET_NEO_VM="false"
# INJECT LOCAL NEO-VM
LOCAL_NEO_VM="false"
LOCAL_NEO_VM_PATH="localfiles/neo-vm"
# ========= INJECT SPECIFIC NEO-VM =========


PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin DeferredRelay LevelDBStore MPTTrie OracleService RestServer RocksDBStore RpcClient RpcServer SQLiteWallet SignClient StateService StorageDumper TokensTracker)
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
