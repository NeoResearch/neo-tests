#!/bin/bash
​
node="/root/nodes/node"
port=30301
httpport=8551
rpcport=8561
wsport=8571
extip=127.0.0.1
networkid_testnet=12227332
networkid_mainnet=47763

echo "$node, rpc port $rpcport, p2p port $port"
​
geth \
--networkid $networkid_testnet \
--nat extip:$extip \
--port $port \
--authrpc.port $rpcport \
--identity=$node \
--maxpeers=50 \
--syncmode full \
--gcmode archive \
--datadir $node \
--bootnodes "enode://65775722283d6b19cf64c875897faf34ee120dc686c552d11c1310ee3d44bad0da88cfd9cef53a92c10604f8140d5210c4381e3e7a99322400130b5b8d4d331b@34.143.193.38:30301" \
--http.api admin,eth,debug,miner,net,txpool,personal,web3,dbft \
--http --http.addr 0.0.0.0 --http.port $httpport --http.vhosts "*" --http.corsdomain '*' \
--ws --ws.addr 0.0.0.0 --ws.port $wsport --ws.api eth,net,web3 --ws.origins '*'  \
--verbosity 3
