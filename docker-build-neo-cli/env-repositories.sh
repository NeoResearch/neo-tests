# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=dbft3.0-doublespeakers
NEO_BLOCKCHAIN_COMMIT=20d0b49

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"

PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore MPTTrie OracleService RocksDBStore RpcClient RpcServer SQLiteWallet StatesDumper TokensTracker )
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
