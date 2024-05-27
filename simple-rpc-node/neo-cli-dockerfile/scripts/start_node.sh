#!/bin/bash
if (($DISABLE_NETWORK_P2P)); then
	echo "Disabling network P2P"
	iptables -A INPUT -p tcp --dport 10333:60333 -j REJECT
	iptables -A OUTPUT -p tcp --dport 10333:60333 -j REJECT
fi

(cd /opt/node/Neo.CLI/; dotnet neo-cli.dll)
