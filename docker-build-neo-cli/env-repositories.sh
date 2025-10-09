# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=dev
NEO_BLOCKCHAIN_COMMIT=5321dfe4dfc75479346abbe3e6dd70306d43df1b

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"

PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore OracleService RestServer RocksDBStore RpcServer SQLiteWallet SignClient StateService StorageDumper TokensTracker)
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
