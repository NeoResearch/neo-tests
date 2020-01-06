#!/bin/bash
source /opt/env-repositories.sh

for i in "${PLUGINS_LIST_NEO_PACKAGE[@]}"
do 
	echo "Going to build plugin ${i}"
	/opt/build_plugin_3x.sh --plugin-name ${i}
	res=$?
	if [ $res = 1 ]; then
	    echo "Going to exit because last return is $res"
	    exit 1
	fi
done

for i in "${PLUGINS_LIST_NO_NEO_PACKAGE[@]}"
do 
	echo "Going to build plugin ${i}"
	/opt/build_plugin_3x.sh --plugin-name ${i}
	res=$?
	if [ $res = 1 ]; then
	    echo "Going to exit because last return is $res"
	    exit 1
	fi
done

for i in "${PLUGINS_UT_LIST[@]}"
do 
	echo "Going to call test ${i}"
	/opt/test_plugin_3x.sh --module-test-name ${i}
	res=$?
	if [ $res = 1 ]; then
	    echo "Going to exit because last return is $res"
	    exit 1
	fi
done

