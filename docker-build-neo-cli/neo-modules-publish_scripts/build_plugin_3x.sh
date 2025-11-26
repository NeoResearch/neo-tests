#!/bin/bash
PLUGIN_TO_INCLUDE=1

function usage {
    echo "Usage: $0 [--plugin-name <plugin to build>]"
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

NEO_PLUGINS_PATH=/opt/neo-node/plugins
DEST_FOLDER=/opt/app/Plugins/$PLUGIN_TO_INCLUDE/
mkdir $DEST_FOLDER
#================= PUBLISH ==============================
echo ""
echo "GOING TO FOLDER $NEO_PLUGINS_PATH"
cd $NEO_PLUGINS_PATH

echo ""
echo "GOING TO PUBLISH $PLUGIN_TO_INCLUDE..."
dotnet publish ./$PLUGIN_TO_INCLUDE -c Release -f net10.0 -o ./$PLUGIN_TO_INCLUDE/app
#================= PUBLISH ==============================


echo "GOING TO CHECK CREATED DLL $PLUGIN_TO_INCLUDE..."
echo ""

ORIGIN_PATH=$NEO_PLUGINS_PATH/$PLUGIN_TO_INCLUDE/app
if [ ! -f $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll ]; then
    echo "PLUGIN DLL File does not exist at $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll"
    exit 1
fi



echo "GOING TO COPY DEPENDENCIES (IF NEEDED - CURRENTLY JUST ORACLE SERVICES)"
echo ""

# =========================================================
# ================= COPPYING DLLS =========================
# =========================================================

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
    exit 
fi

if [ $PLUGIN_TO_INCLUDE = "RestServer" ]; then
    echo "Going to copy file $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll TO $DEST_FOLDER - and some other dependencies"
    cp -ri $ORIGIN_PATH/*.dll $DEST_FOLDER 
    # TODO - The file is not there anymore when updated 16 November 2025
    # cp -ri $ORIGIN_PATH/RestServer.xml $DEST_FOLDER
    exit
fi

if [ $PLUGIN_TO_INCLUDE = "RocksDBStore" ]; then
    echo "Going to copy file $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll TO $DEST_FOLDER - and some other dependencies"
    cp -ri $ORIGIN_PATH/*.dll $DEST_FOLDER    
    exit
fi

if [ $PLUGIN_TO_INCLUDE = "SQLiteWallet" ]; then
    echo "Going to copy file $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll TO $DEST_FOLDER - and some other dependencies"
    cp -ri $ORIGIN_PATH/*.dll $DEST_FOLDER    
    exit
fi

if [ $PLUGIN_TO_INCLUDE = "SignClient" ]; then
    echo "Going to copy file $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll TO $DEST_FOLDER - and some other dependencies"
    cp -ri $ORIGIN_PATH/*.dll $DEST_FOLDER    
    exit
fi

echo "GOING TO COPY DLL ITSELF"
echo ""

echo "Going to copy file $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll TO $DEST_FOLDER"
cp -ri $ORIGIN_PATH/$PLUGIN_TO_INCLUDE.dll $DEST_FOLDER
