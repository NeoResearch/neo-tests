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


ORIGIN_PATH=/opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app

echo "GOING TO CLEAN..."
echo ""
echo "CLEAN MODULE..."
(cd /opt/neo-modules/src/$PLUGIN_TO_INCLUDE; dotnet clean)

echo "CLEAN NeoLib..."
(cd /opt/neo-modules/neoLib/; dotnet clean)
(cd /opt/neo-modules/neoLib/src/Neo; dotnet clean)
(cd /opt/neo-modules/neoLib/src/Neo.Json; dotnet clean)


echo "GOING TO PUBLISH..."
echo ""
(cd /opt/neo-modules/src/$PLUGIN_TO_INCLUDE; dotnet publish -c Release -o app)

echo "GOING TO CHECK CREATED DLL..."
echo ""

if [ ! -f $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll ]; then
    echo "PLUGIN DLL File does not exist at $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll"
    exit 1
fi

echo "GOING TO COPY DEPENDENCIES (IF NEEDED - CURRENTLY JUST ORACLE SERVICES)"
echo ""

DEST_FOLDER=/opt/neoNode/neo-cli/Plugins/$PLUGIN_TO_INCLUDE/
mkdir $DEST_FOLDER

if [ $PLUGIN_TO_INCLUDE = "OracleService" ]; then
    echo "Going to copy file $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll TO $DEST_FOLDER - and some other dependencies"
    cp -ri $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll $DEST_FOLDER
    cp -ri $ORIGIN_PATH/Neo.FileStorage.API.dll $DEST_FOLDER
    cp -ri $ORIGIN_PATH/Grpc.Net.Common.dll $DEST_FOLDER
    cp -ri $ORIGIN_PATH/Grpc.Net.ClientFactory.dll $DEST_FOLDER
    cp -ri $ORIGIN_PATH/Grpc.Net.Client.dll $DEST_FOLDER
    cp -ri $ORIGIN_PATH/Grpc.Core.Api.dll $DEST_FOLDER
    cp -ri $ORIGIN_PATH/Grpc.AspNetCore.Server.dll $DEST_FOLDER
    cp -ri $ORIGIN_PATH/Grpc.AspNetCore.Server.ClientFactory.dll $DEST_FOLDER
    cp -ri $ORIGIN_PATH/Google.Protobuf.dll $DEST_FOLDER
fi

echo "GOING TO COPY DLL ITSELF"
echo ""

if [ $PLUGIN_TO_INCLUDE != "OracleService" ]; then
    echo "Going to copy file /opt/neo-modules/src/$PLUGIN_TO_INCLUDE/app/$PLUGIN_TO_INCLUDE.dll TO /opt/neoNode/neo-cli/Plugins/"
    cp -ri $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll $DEST_FOLDER
fi
