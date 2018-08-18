#!/bin/bash

echo "time2fork script initialized (part 1 - preset)"

echo "reset delay to 0"
# reset basic delay configurations (500 ms)
docker exec -it eco-neo-csharp-node1-running tc qdisc del dev eth0 root
docker exec -it eco-neo-csharp-node2-running tc qdisc del dev eth0 root
docker exec -it eco-neo-csharp-node3-running tc qdisc del dev eth0 root
docker exec -it eco-neo-csharp-node4-running tc qdisc del dev eth0 root

sleep 1

echo "setting delay to 1000ms"
docker exec -it eco-neo-csharp-node1-running tc qdisc add dev eth0 root netem delay 1000ms
docker exec -it eco-neo-csharp-node2-running tc qdisc add dev eth0 root netem delay 1000ms
docker exec -it eco-neo-csharp-node3-running tc qdisc add dev eth0 root netem delay 1000ms
docker exec -it eco-neo-csharp-node4-running tc qdisc add dev eth0 root netem delay 1000ms

echo "shutting down extra nodes rpc1 rpc2"
docker stop eco-neo-csharp-noderpc1-running
docker stop eco-neo-csharp-noderpc2-running

echo "shutting down python"
docker stop eco-neo-python-logger-running
docker stop eco-neo-python-rest-running

echo "shutting neo-scan"
docker stop eco-neo-scan-running

sleep 20

echo "SELECTING SPECIFIC PORTS ONLY"
docker exec -it eco-neo-csharp-node1-running iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
docker exec -it eco-neo-csharp-node1-running iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
docker exec -it eco-neo-csharp-node1-running iptables -A INPUT -i lo -j ACCEPT
docker exec -it eco-neo-csharp-node1-running iptables -A INPUT -p tcp --dport 20333:60333 -j ACCEPT
docker exec -it eco-neo-csharp-node1-running iptables -A INPUT -j REJECT

docker exec -it eco-neo-csharp-node2-running iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
docker exec -it eco-neo-csharp-node2-running iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
docker exec -it eco-neo-csharp-node2-running iptables -A INPUT -i lo -j ACCEPT
docker exec -it eco-neo-csharp-node2-running iptables -A INPUT -p tcp --dport 20333:60333 -j ACCEPT
docker exec -it eco-neo-csharp-node2-running iptables -A INPUT -j REJECT

docker exec -it eco-neo-csharp-node3-running iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
docker exec -it eco-neo-csharp-node3-running iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
docker exec -it eco-neo-csharp-node3-running iptables -A INPUT -i lo -j ACCEPT
docker exec -it eco-neo-csharp-node3-running iptables -A INPUT -p tcp --dport 20333:60333 -j ACCEPT
docker exec -it eco-neo-csharp-node3-running iptables -A INPUT -j REJECT

docker exec -it eco-neo-csharp-node4-running iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
docker exec -it eco-neo-csharp-node4-running iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
docker exec -it eco-neo-csharp-node4-running iptables -A INPUT -i lo -j ACCEPT
docker exec -it eco-neo-csharp-node4-running iptables -A INPUT -p tcp --dport 20333:60333 -j ACCEPT
docker exec -it eco-neo-csharp-node4-running iptables -A INPUT -j REJECT

#docker exec -it eco-neo-csharp-node1-running iptables -A OUTPUT -j ACCEPT
#docker exec -it eco-neo-csharp-node1-running iptables -A OUTPUT -o lo -j ACCEPT
#docker exec -it eco-neo-csharp-node2-running iptables -A OUTPUT -j ACCEPT
#docker exec -it eco-neo-csharp-node2-running iptables -A OUTPUT -o lo -j ACCEPT
#docker exec -it eco-neo-csharp-node3-running iptables -A OUTPUT -j ACCEPT
#docker exec -it eco-neo-csharp-node3-running iptables -A OUTPUT -o lo -j ACCEPT
#docker exec -it eco-neo-csharp-node4-running iptables -A OUTPUT -j ACCEPT
#docker exec -it eco-neo-csharp-node4-running iptables -A OUTPUT -o lo -j ACCEPT



#echo "waiting for some time for system to self adjust (30 seconds)"
#sleep 10
#cat ../../neocompiler-eco/docker-compose-eco-network/logs-neocli-node1/*.log
