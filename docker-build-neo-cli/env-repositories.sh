# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=44c8cd9669beffd8460a56aedf81a53b47ff5b5f

LOCAL_NEO_BLOCKCHAIN="true"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"

PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore MPTTrie OracleService RocksDBStore RpcClient RpcServer SQLiteWallet StateService StorageDumper TokensTracker)
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
