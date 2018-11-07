#!/bin/bash
echo "unlocking everything (TODO - ADD --privileged TO ALL EXEC IFCONFIG)"
./unlockall.sh

echo "find onstop event script (RUN WITH SUDO!!!!)"

PATH_NEOCOMPILER_ECO="../../neocompiler-eco"
if [ -d "$PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1" ]; then

	echo ""
	echo "OFFICIAL ROUND"
	echo ""
	echo "will wait for node 1,2,3 or 4 gets an OnStop event"
	while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep OnStop | wc -l` -eq 0 -o `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -1 | grep OnStop | wc -l`  -eq 0 -o `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node3/*.log | tail -1 | grep OnStop | wc -l`  -eq 0 -o `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node4/*.log | tail -1 | grep OnStop | wc -l`  -eq 0 ]; do
	   :  # no operation
	done

	echo "Well done! Problems detected"
	docker exec -it eco-neo-csharp-node1-running ifconfig eth0 down
	docker exec -it eco-neo-csharp-node2-running ifconfig eth0 down
	docker exec -it eco-neo-csharp-node3-running ifconfig eth0 down
	docker exec -it eco-neo-csharp-node4-running ifconfig eth0 down



	echo "Byebye. everything should be down for your analysis now"

else

	echo "Log folder do not exist"

fi


