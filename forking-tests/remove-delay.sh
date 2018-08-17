#!/bin/bash

echo "removing delay from network"
docker exec -it eco-neo-csharp-node1-running tc qdisc del dev eth0 root
docker exec -it eco-neo-csharp-node2-running tc qdisc del dev eth0 root
docker exec -it eco-neo-csharp-node3-running tc qdisc del dev eth0 root
docker exec -it eco-neo-csharp-node4-running tc qdisc del dev eth0 root
