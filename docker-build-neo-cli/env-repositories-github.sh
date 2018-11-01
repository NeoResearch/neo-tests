cnt=`curl -s -X GET https://api.github.com/repos/vncoelho/neo/commits -H 'Content-Type: application/json' -d '{ "rel": "last"}'`


cnt=`curl -s -X POST http://localhost:30333 -H 'Content-Type: application/json' -d '{ "jsonrpc": "2.0", "id": 5, "method": "getblockcount", "params": [] }'`
https://api.github.com/repos/vncoelho/commits?per_page=1.neo
#GET https://api.github.com/repos/neo-project/neo/commits/master

https://api.github.com/repos/neo-project/neo/git/refs/heads/master

NEO_CLI_BLOCKCHAIN_URL=https://github.com/neo-project/neo-cli.git
NEO_CLI_BRANCH=master
NEO_CLI_COMMIT=6a875d546a9917b984dc88e64828b887de1010f8 
NEO_BLOCKCHAIN_URL=https://github.com/igormcoelho/neo.git
NEO_BLOCKCHAIN_BRANCH=new_commit_phase
NEO_BLOCKCHAIN_COMMIT=fa79898
NEO_PLUGINS_URL=https://github.com/neo-project/neo-plugins.git
NEO_PLUGINS_BRANCH=master
NEO_PLUGINS_COMMIT=ada292dec3c93cd478a101937f99af84a36654b8

LOCAL_NEO_CLI_BLOCKCHAIN="false"
LOCAL_NEO_CLI_BLOCKCHAIN_URL="localfiles/neo-cli"
LOCAL_NEO_BLOCKCHAIN="true"
LOCAL_NEO_BLOCKCHAIN_URL="localfiles/neo-igor"
LOCAL_NEO_PLUGINS="false"
LOCAL_NEO_PLUGINS_URL="localfiles/neo-plugins"

SET_NEO_VM="false"
NEO_VM_URL=https://github.com/neo-project/neo-vm.git
NEO_VM_BRANCH=master
NEO_VM_COMMIT=fa79898
LOCAL_NEO_VM="false"
LOCAL_NEO_VM_URL="localfiles/neo-vm"
