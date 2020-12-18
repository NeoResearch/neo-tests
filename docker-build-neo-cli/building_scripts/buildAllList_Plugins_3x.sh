#!/bin/bash
source /opt/env-repositories.sh

for i in "${PLUGINS_LIST_NEO_PACKAGE[@]}"
do 
	echo "GOING TO BUILD PLUGIN ${i}"
        echo ""
	/opt/build_plugin_3x.sh --plugin-name ${i}
	res=$?
	if [ $res = 1 ]; then
	    echo "GOING TO EXIT BECAUSE LAST VERIFICATION RETURNED $res"
	    echo ""
	    exit 1
	fi
done

echo "PLUGINS_RUN_TESTS is $PLUGINS_RUN_TESTS, WHICH DEFINES IF TESTS ARE GOING TO RUN"
echo ""

if [ "$PLUGINS_RUN_TESTS" = "true" ]; then
	for i in "${PLUGINS_UT_LIST[@]}"
	do 
		echo "GOING TO CALL TEST ${i} FOR PLUGINS"
		echo ""
		/opt/test_plugin_3x.sh --module-test-name ${i}
		res=$?
		if [ $res = 1 ]; then
		    echo "GOING TO EXIT BECAUSE LAST VERIFICATION RETURNED $res"
		    echo ""
		    exit 1
		fi
	done
fi
