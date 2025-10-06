# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=divideStateService
NEO_BLOCKCHAIN_COMMIT=bf1d3586021ba552c50e5a3a95cd7e694da7f626

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"

PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore OracleService RestServer RocksDBStore RpcServer SQLiteWallet SignClient StateRootPlugin StateRpcPlugin StorageDumper TokensTracker)
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
