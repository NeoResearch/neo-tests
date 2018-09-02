#!/bin/bash
echo "unlocking everything (TODO - ADD --privileged TO ALL EXEC IFCONFIG)"
./unlockall.sh

PATH_NEOCOMPILER_ECO="../../neocompiler-eco"

echo "time2fork script initialized (part 2) (RUN WITH SUDO!!!!)"

echo ""
echo "OFFICIAL ROUND"
echo ""
echo "will wait for node1 to become primary again"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep index=2 | grep view=0 | grep Primary | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep view=0 | grep Primary
echo "node1 is primary!"
#TODO - Get Height
uptime

#| sed 's/.*=//'
HEIGHT=$(cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep view=0 | grep Primary | awk '{ print $3 }' | cut -f2 -d"=")
echo "current height is: $HEIGHT"

echo "will block node2"
docker exec -it eco-neo-csharp-node2-running ifconfig eth0 down

sudo echo "I AM BLOCKED!" >> $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/2018-08-18.log

echo "will block node3<->node4 (node3)"
docker exec -it eco-neo-csharp-node3-running iptables -I INPUT -p tcp --dport 20336:20336 -j REJECT
docker exec -it eco-neo-csharp-node3-running iptables -I OUTPUT -p tcp --dport 20336:20336 -j REJECT

echo "will block node3<->node4 (node4)"
docker exec -it eco-neo-csharp-node4-running iptables -I INPUT -p tcp --dport 20335:20335 -j REJECT
docker exec -it eco-neo-csharp-node4-running iptables -I OUTPUT -p tcp --dport 20335:20335 -j REJECT

echo ""
echo "will wait for node1 to receive prepare response from node3 index=3"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep height=$HEIGHT |grep index=3 | grep OnPrepareResponse | wc -l` -eq 0 ]; do
   :  # no operation
done
echo "fully block node1 - This is wrong, because node4 may not have send his prepare response yet - However, it is working..."
docker exec -it eco-neo-csharp-node1-running ifconfig eth0 down

cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep index=3 | grep OnPrepareResponse
docker exec -it eco-neo-csharp-node3-running ifconfig eth0 down

echo ""
echo "will wait for node2 to timeout"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -3 | grep timeout | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -3 | grep timeout

echo ""
echo "will wait for node3 to timeout"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node3/*.log | tail -3 | grep timeout | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node3/*.log | tail -3 | grep timeout

echo ""
echo "will wait for node4 to timeout"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node4/*.log | tail -3 | grep timeout | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node4/*.log | tail -3 | grep timeout

echo ""
echo "Sleeping 30s..."
sleep 30

echo "unblock node2 (block node3, node4 before)"
docker exec -it eco-neo-csharp-node2-running ifconfig eth0 up
docker exec -it eco-neo-csharp-node3-running ifconfig eth0 up
docker exec -it eco-neo-csharp-node4-running ifconfig eth0 up

echo ""
echo "will wait for node2 to relay block"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -3 | grep relay | wc -l` -eq 0 ]; do
   :  # no operation
done

echo ""
echo "unblock node3<->node4"
docker exec -it eco-neo-csharp-node3-running iptables -D INPUT -p tcp --dport 20336:20336 -j ACCEPT
docker exec -it eco-neo-csharp-node3-running iptables -D OUTPUT -p tcp --dport 20336:20336 -j ACCEPT
docker exec -it eco-neo-csharp-node4-running iptables -D INPUT -p tcp --dport 20335:20335 -j ACCEPT
docker exec -it eco-neo-csharp-node4-running iptables -D OUTPUT -p tcp --dport 20335:20335 -j ACCEPT

echo "unblock node1"
docker exec -it eco-neo-csharp-node1-running ifconfig eth0 up

echo "Byebye. Node1 should be stuck"
