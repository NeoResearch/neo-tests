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

if [ ! -f /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$PLUGIN_TO_INCLUDE.dll ]; then
    echo "File does not exist"
    exit 1
fi

if [ $PLUGIN_TO_INCLUDE = "OracleService" ]; then
    echo "Going to copy file /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$PLUGIN_TO_INCLUDE.dll TO /opt/neoNode/neo-cli/Plugins/ - and some other dependencies"
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$PLUGIN_TO_INCLUDE.dll /opt/neoNode/neo-cli/Plugins/
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/Neo.FileStorage.API.dll /opt/neoNode/neo-cli/Plugins/
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/Grpc.Net.Common.dll /opt/neoNode/neo-cli/Plugins/
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/Grpc.Net.ClientFactory.dll /opt/neoNode/neo-cli/Plugins/
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/Grpc.Net.Client.dll /opt/neoNode/neo-cli/Plugins/
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/Grpc.Core.Api.dll /opt/neoNode/neo-cli/Plugins/
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/Grpc.AspNetCore.Server.dll /opt/neoNode/neo-cli/Plugins/
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/Grpc.AspNetCore.Server.ClientFactory.dll /opt/neoNode/neo-cli/Plugins/
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/Google.Protobuf.dll /opt/neoNode/neo-cli/Plugins/
fi

if [ $PLUGIN_TO_INCLUDE != "OracleService" ]; then
    echo "Going to copy file /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$PLUGIN_TO_INCLUDE.dll TO /opt/neoNode/neo-cli/Plugins/"
    cp -ri /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$PLUGIN_TO_INCLUDE.dll /opt/neoNode/neo-cli/Plugins/
fi
