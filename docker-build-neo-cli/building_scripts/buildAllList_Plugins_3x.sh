#!/bin/bash
source /opt/env-repositories.sh

for i in "${PLUGINS_LIST[@]}";
do 
	echo "Going to build plugin ${PLUGINS_LIST[i]}"
	/opt/build_plugin_3x.sh --plugin-name ${PLUGINS_LIST[i]} --delete-neo-ref ${REMOVE_NEO_PACKAGE[i]}
	res=$?
	if [ $res = 1 ]; then
	    echo "Going to exit because last return is $res"
	    exit 1
	fi
done

for i in "${PLUGINS_UT_LIST[@]}";
do 
	echo "Going to call test ${PLUGINS_UT_LIST[i]}"
	/opt/test_plugin_3x.sh --module-test-name ${PLUGINS_UT_LIST[i]}
	res=$?
	if [ $res = 1 ]; then
	    echo "Going to exit because last return is $res"
	    exit 1
	fi
done

