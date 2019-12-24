#!/bin/bash
source /opt/env-repositories.sh

for i in "${PLUGINS_LIST_NEO_PACKAGE[@]}";
do 
	echo "Going to build plugin ${PLUGINS_LIST_NEO_PACKAGE[i]}"
	/opt/build_plugin_3x.sh --plugin-name ${PLUGINS_LIST_NEO_PACKAGE[i]} --delete-neo-ref 1
	res=$?
	if [ $res = 1 ]; then
	    echo "Going to exit because last return is $res"
	    exit 1
	fi
done

for i in "${PLUGINS_LIST_NO_NEO_PACKAGE[@]}";
do 
	echo "Going to build plugin ${PLUGINS_LIST_NO_NEO_PACKAGE[i]}"
	/opt/build_plugin_3x.sh --plugin-name ${PLUGINS_LIST_NO_NEO_PACKAGE[i]} --delete-neo-ref 0
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

