#!/bin/bash

echo "stoppping eco non-essential services"


# ========================================================
# ==== SHUTTING DOWN NEOCOMPILERS NETWORK SERVICES =======
echo "shutting down extra nodes rpc1 rpc2"
docker stop eco-neo-csharp-noderpc1-running
docker stop eco-neo-csharp-noderpc2-running

echo "shutting down python"
docker stop eco-neo-python-logger-running
docker stop eco-neo-python-rest-running

echo "shutting neo-scan"
docker stop eco-neo-scan-api-running
docker stop eco-neo-scan-sync-running
docker stop eco-neo-scan-postgresql-running
# ========================================================

