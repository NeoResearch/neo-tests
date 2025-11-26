#!/bin/bash

set -uo pipefail

# ======== CONFIG =========
: "${USERRPC:?USERRPC not set}"
: "${PASSRPC:?PASSRPC not set}"
: "${TG_BOT_TOKEN:=}"
: "${TG_CHAT_ID:=}"
: "${TG_CHAT_ID_2:=}"


# ======== CONFIG=========
RPC_URL="http://$USERRPC:$PASSRPC@127.0.0.1:10332"
MIN_PEERS=5
STALL_THRESHOLD=2

#echo "RPC IS $RPC_URL"
#echo "TG_BOT_TOKEN IS $TG_BOT_TOKEN"

STATE_FILE="/tmp/neo_monitor_block.state"
COUNT_FILE="/tmp/neo_monitor_stall.count"
HOSTNAME=$(hostname)

send_alert() {
    local message="🚨 *ALERTA NEO NODE* 🚨%0A%0A💻 *Host:* $HOSTNAME%0A⚠️ *Error:* $1"
    curl -s -X POST "https://api.telegram.org/bot$TG_BOT_TOKEN/sendMessage" \
        -d chat_id="$TG_CHAT_ID" \
        -d text="$message" \
        -d parse_mode="Markdown" > /dev/null

    curl -s -X POST "https://api.telegram.org/bot$TG_BOT_TOKEN/sendMessage" \
        -d chat_id="$TG_CHAT_ID_2" \
        -d text="$message" \
        -d parse_mode="Markdown" > /dev/null        
}


# ================= BLOCK HEIGHT =================

DOCKER_PATH="docker exec -it eco-neo-csharp-cnnode-running"
BLOCK_JSON=$($DOCKER_PATH curl -s -k --max-time 10 -H "Content-Type: application/json" -d '{"jsonrpc": "2.0", "method": "getblockcount", "params": [], "id": 1}' $RPC_URL)

#echo "HI $BLOCK_JSON"

if [ -z "$BLOCK_JSON" ]; then
    echo "El proceso neo-cli NO responde al RPC. Posible crash."
    send_alert "El proceso neo-cli NO responde al RPC. Posible crash."
    # systemctl restart neo
    exit 1
fi

CURRENT_BLOCK=$(echo $BLOCK_JSON | jq -r '.result')

#echo "HI $CURRENT_BLOCK"

if ! [[ "$CURRENT_BLOCK" =~ ^[0-9]+$ ]]; then
    send_alert "Respuesta RPC inválida al pedir bloque."
    exit 1
fi

if [ -f "$STATE_FILE" ]; then
    LAST_BLOCK=$(cat "$STATE_FILE")

    #echo "HI $LAST_BLOCK"

    if [ "$CURRENT_BLOCK" -eq "$LAST_BLOCK" ]; then
        if [ -f "$COUNT_FILE" ]; then
            STALL_COUNT=$(cat "$COUNT_FILE")
            STALL_COUNT=$((STALL_COUNT + 1))
        else
            STALL_COUNT=1
        fi

        echo $STALL_COUNT > "$COUNT_FILE"

        if [ "$STALL_COUNT" -ge "$STALL_THRESHOLD" ]; then
            send_alert "La cadena parece ESTANCADA.%0ABloque actual: $CURRENT_BLOCK%0ALlevamos $STALL_COUNT chequeos sin avanzar."
            # echo 0 > "$COUNT_FILE"
        fi
    else
        echo 0 > "$COUNT_FILE"
    fi
else
    echo 0 > "$COUNT_FILE"
fi

echo $CURRENT_BLOCK > "$STATE_FILE"

# ================= PEERS =================
PEERS_JSON=$($DOCKER_PATH curl -s -k --max-time 10 -H "Content-Type: application/json" -d '{"jsonrpc": "2.0", "method": "getpeers", "params": [], "id": 1}' $RPC_URL)
CONNECTED_PEERS=$(echo $PEERS_JSON | jq -r '.result.connected | length')

#echo "HI $PEERS_JSON"
#echo "HI $CONNECTED_PEERS"

if [ -z "$CONNECTED_PEERS" ] || [ "$CONNECTED_PEERS" == "null" ]; then
     CONNECTED_PEERS=0
fi

if [ "$CONNECTED_PEERS" -le "$MIN_PEERS" ]; then
    send_alert "Baja cantidad de Peers.%0AConectados: $CONNECTED_PEERS%0AMínimo requerido: $MIN_PEERS"
fi

#echo "BYE"

exit 0
