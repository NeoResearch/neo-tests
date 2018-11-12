#!/bin/bash

echo "time2fork script initialized (part 1 - preset)"

echo "reset delay to 0"
./remove-delay.sh

sleep 1

DESIRED_DELAY=1000
echo "setting delay to ${DESIRED_DELAY}ms"
docker exec -it eco-neo-csharp-node1-running tc qdisc add dev eth0 root netem delay ${DESIRED_DELAY}ms
docker exec -it eco-neo-csharp-node2-running tc qdisc add dev eth0 root netem delay ${DESIRED_DELAY}ms
docker exec -it eco-neo-csharp-node3-running tc qdisc add dev eth0 root netem delay ${DESIRED_DELAY}ms
docker exec -it eco-neo-csharp-node4-running tc qdisc add dev eth0 root netem delay ${DESIRED_DELAY}ms

# ========================================================
# ==== SHUTTING DOWN NEOCOMPILERS NETWORK SERVICES =======
./stop_eco_nonessential_services.sh
# ========================================================

sleep 2

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
