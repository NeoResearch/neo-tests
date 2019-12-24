#!/bin/bash
PLUGIN_TO_INCLUDE=1
DELETE_NEO_REF=1

function usage {
    echo "Usage: $0 [--plugin-name <plugin to build> --delete-neo-ref <bool>]"
}

while [[ "$#" > 0 ]]; do case $1 in
    -h)
        usage
        exit 0
        ;;
    --plugin-name)
	echo "Getting plugin name as parameter $2";
        PLUGIN_TO_INCLUDE=$2
        shift; shift
        ;;
    --delete-neo-ref)
	echo "Setting to delete reference of not $3";
        DELETE_NEO_REF=$3
        shift; shift
        ;;
    *)
        usage
        exit 1
        ;;
  esac;
done

dotnet remove /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj package neo
dotnet sln /opt/neoNode/neo-node.sln add /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj
dotnet add /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj reference /opt/neoLib/src/neo/neo.csproj
dotnet publish /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE.csproj -o $PLUGIN_TO_INCLUDE -c Release

#ls /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE
#ls /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/$PLUGIN_TO_INCLUDE
#ls /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/bin/Release
#ls /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/bin/Release/netstandard2.1/
#ls /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/bin/Release/netstandard2.1/ubuntu.18.04-x64

BUILD_FOLDER=bin/Release/netstandard2.1

if [ ! -f /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/$BUILD_FOLDER/$PLUGIN_TO_INCLUDE.dll ]; then
    echo "File does not exist"
    exit 1
fi

#cp -ri /opt/neo-plugins/src/$PLUGIN_TO_INCLUDE/$BUILD_FOLDER/$PLUGIN_TO_INCLUDE.dll /opt/neoNode/neo-cli/neo-cli/Plugins/
