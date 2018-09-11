#!/bin/bash
cd /opt/node/neo-cli/

if (($DISABLE_NETWORK_P2P)); then
	echo "Disabling network P2P"
	iptables -A INPUT -p tcp --dport 10333:60333 -j REJECT
	iptables -A OUTPUT -p tcp --dport 10333:60333 -j REJECT
fi

if (($IS_RPC)); then
	(cd /opt/node/neo-cli/; dotnet neo-cli.dll --rpc --log)
else
	(cd /opt/node/neo-cli/; dotnet neo-cli.dll --log)
fi
