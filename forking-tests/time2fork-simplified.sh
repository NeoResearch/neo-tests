#!/bin/bash

PATH_NEOCOMPILER_ECO="../../neocompiler-eco"

echo "time2fork script initialized (part 2) (RUN WITH SUDO!!!!)"

echo "WARMUP ROUND!"
echo ""
echo "will wait for node1 to become primary"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep index=2 | grep view=0 | grep Primary | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep view=0 | grep Primary
echo "node1 is primary!"
uptime

echo "will wait for node1 to become backup"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep index=2 | grep view=0 | grep Backup | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -1 | grep initialize | grep view=0 | grep Backup
echo "node1 is backup!"
uptime

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

#echo "will wait for node2 to become backup"
#while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -1 | grep initialize | grep index=0 | grep view=0 | grep Backup | wc -l` -eq 0 ]; do
#   :  # no operation
#done
#cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -1 | grep initialize | grep view=0 | grep Backup
#echo "node2 is backup!"
#uptime

echo ""
echo "will block node2"
docker exec -it eco-neo-csharp-node2-running ifconfig eth0 down
#docker exec -it eco-neo-csharp-node2-running iptables -A INPUT -p tcp --dport 20333:20336 -j DROP
#docker exec -it eco-neo-csharp-node2-running iptables -A OUTPUT -p tcp --dport 20333:20336 -j DROP
#echo "forbid communication with node2"
#docker exec -it eco-neo-csharp-node1-running iptables -A OUTPUT -p tcp --dport 20334:20334 -j DROP
#docker exec -it eco-neo-csharp-node3-running iptables -A OUTPUT -p tcp --dport 20334:20334 -j DROP
#docker exec -it eco-neo-csharp-node4-running iptables -A OUTPUT -p tcp --dport 20334:20334 -j DROP

sudo echo "I AM BLOCKED!" >> $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/2018-08-18.log

echo "will block node3<->node4 (node3)"
docker exec -it eco-neo-csharp-node3-running iptables -I INPUT -p tcp --dport 20336:20336 -j DROP
docker exec -it eco-neo-csharp-node3-running iptables -I OUTPUT -p tcp --dport 20336:20336 -j DROP

echo "will block node3<->node4 (node4)"
docker exec -it eco-neo-csharp-node4-running iptables -I INPUT -p tcp --dport 20335:20335 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -I OUTPUT -p tcp --dport 20335:20335 -j DROP

echo "forcing delay of node4 to be longer than node3 - node1To6s"
#docker exec -it eco-neo-csharp-node3-running tc qdisc add dev eth0 root netem delay 2000ms
#docker exec -it eco-neo-csharp-node4-running tc qdisc add dev eth0 root netem delay 4000ms
#docker exec -it eco-neo-csharp-node1-running tc qdisc add dev eth0 root netem delay 6000ms

echo ""
echo "will wait for node1 to receive prepare response from node3 index=3"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep height=$HEIGHT |grep index=3 | grep OnPrepareResponse | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep index=3 | grep OnPrepareResponse
docker exec -it eco-neo-csharp-node3-running ifconfig eth0 down
echo "fully block node1 - This is wrong, because node4 may not have send his prepare response yet"
docker exec -it eco-neo-csharp-node1-running ifconfig eth0 down

#echo ""
#echo "will wait for node1 to receive prepare response from node4 index=1"
#while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep index=1 | grep OnPrepareResponse | wc -l` -eq 0 ]; do
#   :  # no operation
#done
#cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep index=1 | grep OnPrepareResponse
#docker exec -it eco-neo-csharp-node4-running ifconfig eth0 down


#echo ""
#echo "will wait for node1, node3 or node 4 relay block"
#while [ (`cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep relay | wc -l` -eq 0) || (`cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node3/*.log | tail -4 | grep relay | wc -l` -eq 0) || (`cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node4/*.log | tail -4 | grep relay | wc -l` -eq 0)]; do
#   :  # no operation
#done
#cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/*.log | tail -4 | grep relay

#docker exec -it eco-neo-csharp-node1-running iptables -A INPUT -p tcp --dport 20333:20336 -j DROP
#docker exec -it eco-neo-csharp-node1-running iptables -A OUTPUT -p tcp --dport 20333:20336 -j DROP

# TODO Send a raw transaction




sudo echo "I AM BLOCKED!" >> $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/2018-08-18.log

echo "will wait for node2 to timeout"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -2 | grep timeout | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -2 | grep timeout

echo "will wait for node3 to timeout"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node3/*.log | tail -2 | grep timeout | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node3/*.log | tail -2 | grep timeout

echo "will wait for node4 to timeout"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node4/*.log | tail -2 | grep timeout | wc -l` -eq 0 ]; do
   :  # no operation
done
cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node4/*.log | tail -2 | grep timeout

sleep 30

echo "unblock node2 (block node3, node4 before)"
docker exec -it eco-neo-csharp-node2-running ifconfig eth0 up
docker exec -it eco-neo-csharp-node3-running ifconfig eth0 up
docker exec -it eco-neo-csharp-node4-running ifconfig eth0 up
#docker exec -it eco-neo-csharp-node2-running iptables -D INPUT -p tcp --dport 20333:20336 -j DROP
#docker exec -it eco-neo-csharp-node2-running iptables -D OUTPUT -p tcp --dport 20333:20336 -j DROP

sudo echo "I AM UNBLOCKED!" >> $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/2018-08-18.log
#sleep 1

sudo echo "I AM UNBLOCKED (node3 and node4 are back)!" >> $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/2018-08-18.log

#echo "will wait for node2 index=0 to become primary nv=1"
#while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -1 | grep initialize | grep index=0 | grep view=1 | grep Primary | wc -l` -eq 0 ]; do
#   :  # no operation
#done

echo "unblock node3<->node4"
docker exec -it eco-neo-csharp-node3-running iptables -D INPUT -p tcp --dport 20336:20336 -j DROP
docker exec -it eco-neo-csharp-node3-running iptables -D OUTPUT -p tcp --dport 20336:20336 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -D INPUT -p tcp --dport 20335:20335 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -D OUTPUT -p tcp --dport 20335:20335 -j DROP

echo ""
echo "will wait for node2 to relay block"
while [ `cat $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node2/*.log | tail -3 | grep relay | wc -l` -eq 0 ]; do
   :  # no operation
done

echo "unblock node1"
docker exec -it eco-neo-csharp-node2-running ifconfig eth0 up
#docker exec -it eco-neo-csharp-node1-running iptables -D INPUT -p tcp --dport 20333:20336 -j DROP
#docker exec -it eco-neo-csharp-node1-running iptables -D OUTPUT -p tcp --dport 20333:20336 -j DROP

sudo echo "I AM UNBLOCKED!" >> $PATH_NEOCOMPILER_ECO/docker-compose-eco-network/logs-neocli-node1/2018-08-17.log
