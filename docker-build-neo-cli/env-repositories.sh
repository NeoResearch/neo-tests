# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=c550fc2

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/cschuchardt88/neo-modules.git
NEO_PLUGINS_BRANCH=dotnet-upgrade
NEO_PLUGINS_COMMIT=da29890

LOCAL_NEO_BLOCKCHAIN="true"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"
LOCAL_NEO_PLUGINS="true"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-modules-cris"

PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs DBFTPlugin LevelDBStore MPTTrie OracleService RocksDBStore RpcClient RpcServer SQLiteWallet StateService StatesDumper TokensTracker )
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
