# https://github.com/neo-project/neo/commits/master
NEO_BLOCKCHAIN_URL=https://github.com/neo-project/neo.git
NEO_BLOCKCHAIN_BRANCH=master
NEO_BLOCKCHAIN_COMMIT=447b149e117589a1ceed0e754d5616917e555f52 

# https://github.com/neo-project/neo-modules/commits/master
NEO_PLUGINS_URL=https://github.com/neo-project/neo-modules.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=cde29160873fd8c669ad5d086e84602049c5fd47

LOCAL_NEO_BLOCKCHAIN="false"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo"
LOCAL_NEO_PLUGINS="false"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-modules"


# ========= INJECT SPECIFIC NEO-VM =========

PLUGINS_LIST_NEO_PACKAGE=(ApplicationLogs LevelDBStore MPTTrie OracleService RocksDBStore RpcClient RpcServer SQLiteWallet StateService StatesDumper TokensTracker DBFTPlugin)
PLUGINS_UT_LIST=(Neo.Cryptography.MPTTrie.Tests Neo.Network.RPC.Tests Neo.Plugins.OracleService.Tests  Neo.Plugins.RpcServer.Tests  Neo.Plugins.Storage.Tests)
  
NEO_BLOCKCHAIN_RUN_TESTS="true"
PLUGINS_RUN_TESTS="true"
