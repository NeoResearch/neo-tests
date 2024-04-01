#!/bin/bash
source /opt/env-repositories.sh

for i in "${PLUGINS_LIST_NEO_PACKAGE[@]}"
do 
	# Informing the user about the plugin being built
	echo "GOING TO BUILD PLUGIN ${i}"
        echo ""
        
        # Calling the build script for each plugin
	/opt/build_plugin_3x.sh --plugin-name ${i}
	
	# Capturing the exit status of the build script
	res=$?
	
	# Checking if the build script exited with a status of 1 (indicating an error)
	if [ $res = 1 ]; then
	    echo "GOING TO EXIT BECAUSE LAST VERIFICATION RETURNED $res"
	    echo ""
	    exit 1
	fi
done

echo "PLUGINS_RUN_TESTS is $PLUGINS_RUN_TESTS, WHICH DEFINES IF TESTS ARE GOING TO RUN"
echo ""

/opt/test_plugin_3x.sh

echo "Script buildAllList_Plugins finished!!"
echo ""
