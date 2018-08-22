#!/bin/bash

echo "setting eth0 of all 4 nodes up again"
docker exec -it eco-neo-csharp-node1-running ifconfig eth0 up
docker exec -it eco-neo-csharp-node2-running ifconfig eth0 up
docker exec -it eco-neo-csharp-node3-running ifconfig eth0 up
docker exec -it eco-neo-csharp-node4-running ifconfig eth0 up

echo "unblock node1"
docker exec -it eco-neo-csharp-node1-running iptables -D INPUT -p tcp --dport 20333:20336 -j DROP
docker exec -it eco-neo-csharp-node1-running iptables -D OUTPUT -p tcp --dport 20333:20336 -j DROP

echo "unblock node2"
docker exec -it eco-neo-csharp-node2-running iptables -D INPUT -p tcp --dport 20333:20336 -j DROP
docker exec -it eco-neo-csharp-node2-running iptables -D OUTPUT -p tcp --dport 20333:20336 -j DROP

echo "unforbid communications with node2"
docker exec -it eco-neo-csharp-node1-running iptables -D OUTPUT -p tcp --dport 20334:20334 -j DROP
docker exec -it eco-neo-csharp-node3-running iptables -D OUTPUT -p tcp --dport 20334:20334 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -D OUTPUT -p tcp --dport 20334:20334 -j DROP

echo "unblock node3 <-> node4"
docker exec -it eco-neo-csharp-node3-running iptables -D INPUT -p tcp --dport 20336:20336 -j DROP
docker exec -it eco-neo-csharp-node3-running iptables -D OUTPUT -p tcp --dport 20336:20336 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -D INPUT -p tcp --dport 20335:20335 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -D OUTPUT -p tcp --dport 20335:20335 -j DROP

echo "unblock node1 -> (node3,node4)"
docker exec -it eco-neo-csharp-node3-running iptables -D INPUT -p tcp --dport 20333:20333 -j DROP
docker exec -it eco-neo-csharp-node4-running iptables -D INPUT -p tcp --dport 20333:20333 -j DROP

echo "unblock specifics in node1"
docker exec -it eco-neo-csharp-node1-running iptables -D OUTPUT -p tcp --dport 20335:20335 -j DROP
docker exec -it eco-neo-csharp-node1-running iptables -D OUTPUT -p tcp --dport 20336:20336 -j DROP
