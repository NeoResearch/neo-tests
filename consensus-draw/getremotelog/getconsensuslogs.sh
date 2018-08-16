#!/bin/bash
echo "getting logs..."
cp ../../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log log3.log
cp ../../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node2/*.log log1.log
cp ../../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node3/*.log log4.log
cp ../../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node4/*.log log2.log

echo "Converting logs to js format"
./convertlogstojs.sh

echo "finished"
