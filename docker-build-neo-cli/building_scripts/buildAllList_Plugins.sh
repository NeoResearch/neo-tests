#!/bin/bash
source /opt/env-repositories.sh

for plugin in $PLUGINS_LIST
do 
	echo "Going to build plugin $plugin"
	/opt/build_plugin.sh --plugin-name $plugin
done
