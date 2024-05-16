# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=7f227a3026fadeb9723280e6f961b6f29b0f8a7a

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/neo-project/neo-modules.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=1577ad43941bd4bbe61d31e1843dca697d1f2da0

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"
LOCAL_NEO_PLUGINS="false"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-modules-cris"

PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore MPTTrie OracleService RocksDBStore RpcClient RpcServer SQLiteWallet StateService StatesDumper TokensTracker )
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
