#!/bin/bash
source /opt/env-repositories.sh

for plugin in $PLUGINS_LIST
do 
	echo "Going to build plugin $plugin"
	/opt/build_plugin_2x.sh --plugin-name $plugin
	res=$?
	if [ $res = 1 ]; then
	    echo "Going to exit because last return is $res"
	    exit 1
	fi
done


