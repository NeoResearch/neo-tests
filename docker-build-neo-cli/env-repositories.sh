# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/cschuchardt88/neo.git
NEO_BLOCKCHAIN_BRANCH=fix-neo-cli
NEO_BLOCKCHAIN_COMMIT=010eb73 

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/cschuchardt88/neo-modules.git
NEO_PLUGINS_BRANCH=RestServer
NEO_PLUGINS_COMMIT=68c4dfe3625583a21725457184c8c5f9ace65722

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"
LOCAL_NEO_PLUGINS="false"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-modules"

PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs LevelDBStore MPTTrie OracleService RocksDBStore RpcClient RestServer RpcServer SQLiteWallet StateService StatesDumper TokensTracker DBFTPlugin)
PLUGINS_UT_LIST=(Neo.Cryptography.MPTTrie.Tests Neo.Network.RPC.Tests Neo.Plugins.OracleService.Tests Neo.Plugins.RpcServer.Tests  Neo.Plugins.Storage.Tests)
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
