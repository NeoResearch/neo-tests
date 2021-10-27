#!/bin/bash
PLUGIN_TO_INCLUDE=1

function usage {
    echo "Usage: $0 [--plugin-name <plugin to build> --delete-neo-ref <bool>]"
}

while [[ "$#" > 0 ]]; do case $1 in
    -h)
        usage
        exit 0
        ;;
    --plugin-name)
	echo "GETTING PLUGIN NAME AS PARAMETER $2";
        PLUGIN_TO_INCLUDE=$2
        shift; shift
        ;;
    *)
        usage
        exit 1
        ;;
  esac;
done


echo "GOING TO PUBLISH..."
echo ""
(cd /opt/neo-modules/src/$PLUGIN_TO_INCLUDE; dotnet publish -c Release -o /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app)

# Recently removed by https://github.com/neo-project/neo-modules/pull/442
#if [ "$PLUGIN_TO_INCLUDE" = "RpcServer" ]; then
#   echo "Going to copy file Microsoft.AspNetCore.ResponseCompression.dll because RpcServer needs it together."
#   cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/Microsoft.AspNetCore.ResponseCompression.dll /opt/neoNode/neo-cli/Plugins/
#fi

if [ ! -f /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$PLUGIN_TO_INCLUDE.dll ]; then
    echo "File does not exist"
    exit 1
fi



if [ $PLUGIN_TO_INCLUDE = "OracleService" ]; then
    echo "Going to copy all dll files /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$*.dll TO /opt/neoNode/neo-cli/Plugins/"
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/*.dll /opt/neoNode/neo-cli/Plugins/
fi

if [ $PLUGIN_TO_INCLUDE != "OracleService" ]; then
    echo "Going to copy file /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$PLUGIN_TO_INCLUDE.dll TO /opt/neoNode/neo-cli/Plugins/"
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$PLUGIN_TO_INCLUDE.dll /opt/neoNode/neo-cli/Plugins/
fi
