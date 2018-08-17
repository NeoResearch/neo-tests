#!/bin/bash

echo "verifying iptables"
echo "=================================================="
echo "node1"
docker exec -it eco-neo-csharp-node1-running iptables -L
echo "=================================================="
echo "node2"
docker exec -it eco-neo-csharp-node2-running iptables -L
echo "=================================================="
echo "node3"
docker exec -it eco-neo-csharp-node3-running iptables -L
echo "=================================================="
echo "node4"
docker exec -it eco-neo-csharp-node4-running iptables -L
