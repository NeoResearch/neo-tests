#!/bin/bash
cp ../../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log log1.log
cp ../../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node2/*.log log2.log
cp ../../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node3/*.log log3.log
cp ../../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node4/*.log log4.log

echo "// log1" > log1.js
echo "let textlog1=\`" >> log1.js
cat log1.log | tail -n 50 >> log1.js
echo "\`;" >> log1.js

echo "// log2" > log2.js
echo "let textlog2=\`" >> log2.js
cat log2.log | tail -n 50 >> log2.js
echo "\`;" >> log2.js

echo "// log3" > log3.js
echo "let textlog3=\`" >> log3.js
cat log3.log | tail -n 50 >> log3.js
echo "\`;" >> log3.js

echo "// log4" > log4.js
echo "let textlog4=\`" >> log4.js
cat log4.log | tail -n 50 >> log4.js
echo "\`;" >> log4.js
