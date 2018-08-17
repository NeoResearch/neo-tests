#!/bin/bash

echo "time2fork script initialized (part 2)"

echo "WARMUP ROUND!"
echo ""
echo "will wait for node1 to become primary"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep index=2 | grep view=0 | grep Primary | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep view=0 | grep Primary
echo "node1 is primary!"
uptime

echo "will wait for node1 to become backup"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep index=2 | grep view=0 | grep Backup | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep view=0 | grep Backup
echo "node1 is backup!"
uptime

echo ""
echo "OFFICIAL ROUND"
echo ""
echo "will wait for node1 to become primary again"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep index=2 | grep view=0 | grep Primary | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep view=0 | grep Primary
echo "node1 is primary!"
uptime

echo "will wait for node2 to become backup"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node2/*.log | tail -1 | grep initialize | grep index=0 | grep view=0 | grep Backup | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node2/*.log | tail -1 | grep initialize | grep view=0 | grep Backup
echo "node2 is backup!"
uptime

echo ""
echo "will block node2"
docker exec -it eco-neo-csharp-node2-running iptables -A INPUT -p tcp --dport 20333:20336 -j DROP
docker exec -it eco-neo-csharp-node2-running iptables -A OUTPUT -p tcp --dport 20333:20336 -j DROP
echo "forbid communication with node2"
docker exec -it eco-neo-csharp-node1-running iptables -A OUTPUT -p tcp --dport 20334:20334 -j DROP
docker exec -it eco-neo-csharp-node3-running iptables -A OUTPUT -p tcp --dport 20334:20334 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -A OUTPUT -p tcp --dport 20334:20334 -j DROP
#docker exec -it eco-neo-csharp-node2-running iptables -D INPUT -p tcp --dport 10333:30336 -j DROP && iptables -D OUTPUT -p tcp --dport 10333:30336 -j DROP

echo "will block node3<->node4 (node3)"
docker exec -it eco-neo-csharp-node3-running iptables -A INPUT -p tcp --dport 20336:20336 -j DROP
docker exec -it eco-neo-csharp-node3-running iptables -A OUTPUT -p tcp --dport 20336:20336 -j DROP

echo "will block node3<->node4 (node4)"
docker exec -it eco-neo-csharp-node4-running iptables -A INPUT -p tcp --dport 20335:20335 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -A OUTPUT -p tcp --dport 20335:20335 -j DROP

echo ""
echo "will wait for node1 to timeout"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -2 | grep timeout | grep view=0 | grep Primary | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -2 | grep timeout | grep view=0 | grep Primary
echo "node1 timeout"
uptime

echo ""
echo "will wait for node3 to receive prepare request"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node3/*.log | tail -3 | grep index=2 | grep OnPrepareRequest | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node3/*.log | tail -3 | grep index=2 | grep OnPrepareRequest

echo "blocking OUTPUT on node1 to node3 (messages from node1 to node3)"
docker exec -it eco-neo-csharp-node1-running iptables -A OUTPUT -p tcp --dport 20335:20335 -j DROP
echo "blocking INPUT on node3 from node1 (messages from node1 to node3)"
docker exec -it eco-neo-csharp-node3-running iptables -A INPUT -p tcp --dport 20333:20333 -j DROP

echo ""
echo "will wait for node4 to receive prepare request"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node4/*.log | tail -3 | grep index=2 | grep OnPrepareRequest | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node4/*.log | tail -3 | grep index=2 | grep OnPrepareRequest

echo "blocking OUTPUT on node1 to node4 (messages from node1 to node4)"
docker exec -it eco-neo-csharp-node1-running iptables -A OUTPUT -p tcp --dport 20336:20336 -j DROP
echo "blocking INPUT on node4 from node1 (messages from node1 to node4)"
docker exec -it eco-neo-csharp-node4-running iptables -A INPUT -p tcp --dport 20333:20333 -j DROP

echo ""
echo "will wait for node1 to receive prepare response from node3 index=3"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep index=3 | grep OnPrepareResponse | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep index=3 | grep OnPrepareResponse

echo ""
echo "will wait for node1 to receive prepare response from node4 index=1"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep index=1 | grep OnPrepareResponse | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep index=1 | grep OnPrepareResponse

echo ""
echo "will wait for node1 to relay block"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep relay | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep relay

echo "fully block node1"
docker exec -it eco-neo-csharp-node1-running iptables -A INPUT -p tcp --dport 20333:20336 -j DROP
docker exec -it eco-neo-csharp-node1-running iptables -A OUTPUT -p tcp --dport 20333:20336 -j DROP

echo "will wait for node2 to timeout"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node2/*.log | tail -2 | grep timeout | wc -l` -eq 0 ]; do
   :  # no operation
done
cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node2/*.log | tail -2 | grep timeout

echo "unblock node2"
docker exec -it eco-neo-csharp-node2-running iptables -D INPUT -p tcp --dport 20333:20336 -j DROP
docker exec -it eco-neo-csharp-node2-running iptables -D OUTPUT -p tcp --dport 20333:20336 -j DROP

echo "will wait for node2 index=0 to become primary nv=1"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node2/*.log | tail -1 | grep initialize | grep index=0 | grep view=1 | grep Primary | wc -l` -eq 0 ]; do
   :  # no operation
done

echo "unblock node3<->node4"
docker exec -it eco-neo-csharp-node3-running iptables -D INPUT -p tcp --dport 20336:20336 -j DROP
docker exec -it eco-neo-csharp-node3-running iptables -D OUTPUT -p tcp --dport 20336:20336 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -D INPUT -p tcp --dport 20335:20335 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -D OUTPUT -p tcp --dport 20335:20335 -j DROP

echo ""
echo "will wait for node2 to relay block"
while [ `cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node2/*.log | tail -3 | grep relay | wc -l` -eq 0 ]; do
   :  # no operation
done

echo "unblock node1"
docker exec -it eco-neo-csharp-node1-running iptables -D INPUT -p tcp --dport 20333:20336 -j DROP
docker exec -it eco-neo-csharp-node1-running iptables -D OUTPUT -p tcp --dport 20333:20336 -j DROP
