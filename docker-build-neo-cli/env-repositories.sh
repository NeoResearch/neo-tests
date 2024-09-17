# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=c69791f718d1856109230af74164db6b43698e4d

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"

PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore MPTTrie OracleService RocksDBStore RpcClient RpcServer SQLiteWallet StateService StorageDumper TokensTracker)
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
