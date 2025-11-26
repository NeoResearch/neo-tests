#!/bin/bash
source /opt/env-repositories.sh

for i in "${PLUGINS_LIST_NEO_PACKAGE[@]}"
do 
	echo "GOING TO BUILD PLUGIN ${i}"
        echo ""
        
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

echo "Script buildAllList_Plugins finished!!"
echo ""
