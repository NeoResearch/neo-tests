#!/bin/bash

echo "NOVO CODIGO!"

echo "writing specifications"
echo "build git project specifications" > /opt/build/projecspecs.log
echo "neo-cli:" >> /opt/build/projecspecs.log
(cd /opt/neo-cli && git show >> /opt/build/projecspecs.log)
echo "neo:" >> /opt/build/projecspecs.log
(cd /opt/neo && git show >> /opt/build/projecspecs.log)
echo "neo-plugins:" >> /opt/build/projecspecs.log
(cd /opt/neo-plugins && git show >> /opt/build/projecspecs.log)
dotnet --info

#dotnet nuget locals --clear all

echo ""
echo "configuring plugins"
echo "mkdir /opt/neo-cli/neo-cli/neo-cli/Plugins/"
rm -rf /opt/neo-cli/neo-cli/neo-cli/Plugins/
mkdir -p /opt/neo-cli/neo-cli/neo-cli/Plugins/
echo "mkdir /opt/neo-cli/neo-cli/neo-cli/Plugins-disabled/"
rm -rf /opt/neo-cli/neo-cli/neo-cli/Plugins-disabled/
mkdir -p /opt/neo-cli/neo-cli/neo-cli/Plugins-disabled/



echo ""
echo "================================================"
echo "BUILDING plugin SimplePolicy"
echo "================================================"
echo ""
PLUGIN_TO_INCLUDE_I="SimplePolicy"

echo "PREPARING TESTS FOR $PLUGIN_TO_INCLUDE_I PLUGIN"

echo "dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj package neo"
dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj package neo

#echo ""
#echo "dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj"
#dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj

echo ""
echo "dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj reference /opt/neo/neo/neo.csproj"
dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj reference /opt/neo/neo/neo.csproj

echo ""
echo "dotnet test --verbosity n /opt/neo-plugins/SimplePolicy.UnitTests/SimplePolicy.UnitTests.csproj"
dotnet test --verbosity n /opt/neo-plugins/SimplePolicy.UnitTests/SimplePolicy.UnitTests.csproj
echo ""


#dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj -o $PLUGIN_TO_INCLUDE_I -c Release -r ubuntu.16.04-x64 -f netstandard2.0
#cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/


#dotnet restore /opt/neo/neo.UnitTests/neo.UnitTests.csproj
echo ""
echo "dotnet test --verbosity v /opt/neo/neo.UnitTests/neo.UnitTests.csproj"
(cd /opt/neo/ && dotnet test --verbosity n neo.UnitTests/neo.UnitTests.csproj)
echo ""

#exit 1

#################################################


echo ""
echo "================================================"
echo "BUILDING plugin SimplePolicy"
echo "================================================"
echo ""
PLUGIN_TO_INCLUDE_I="SimplePolicy"
dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj package neo
dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj reference /opt/neo/neo/neo.csproj
dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj -o $PLUGIN_TO_INCLUDE_I -c Release -r ubuntu.16.04-x64 -f netstandard2.0
cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/


echo ""
echo "================================================"
echo "BUILDING plugin StatesDumper"
echo "================================================"
echo ""
PLUGIN_TO_INCLUDE_I="StatesDumper"
dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj package neo
dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj reference /opt/neo/neo/neo.csproj
dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj -o $PLUGIN_TO_INCLUDE_I -c Release -r ubuntu.16.04-x64 -f netstandard2.0
cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/

echo ""
echo "================================================"
echo "BUILDING plugin ApplicationLogs"
echo "================================================"
echo ""
PLUGIN_TO_INCLUDE_I="ApplicationLogs"
dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj package neo
dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj reference /opt/neo/neo/neo.csproj
dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj -o $PLUGIN_TO_INCLUDE_I -c Release -r ubuntu.16.04-x64 -f netstandard2.0
cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/

echo ""
echo "================================================"
echo "BUILDING plugin RpcSecurity"
echo "================================================"
echo ""
PLUGIN_TO_INCLUDE_I="RpcSecurity"
dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj package neo
dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj reference /opt/neo/neo/neo.csproj
dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj -o $PLUGIN_TO_INCLUDE_I -c Release -r ubuntu.16.04-x64 -f netstandard2.0
cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/


echo ""
echo "================================================"
echo "BUILDING plugin ImportBlocks"
echo "================================================"
echo ""
PLUGIN_TO_INCLUDE_I="ImportBlocks"
dotnet remove /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj package neo
dotnet add /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj reference /opt/neo/neo/neo.csproj
dotnet publish /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.csproj -o $PLUGIN_TO_INCLUDE_I -c Release -r ubuntu.16.04-x64 -f netstandard2.0
cp -ri /opt/neo-plugins/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I/$PLUGIN_TO_INCLUDE_I.dll /opt/neo-cli/neo-cli/neo-cli/Plugins/

#####################

# remove neo-cli package and reference to local neo
echo ""
echo "================================================"
echo "UPDATING REFERENCE OF PROJECT neo INSIDE neo-cli"
echo "================================================"
echo ""
echo "dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo"
dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo

echo ""
echo "dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj"
dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj

echo ""
echo "dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neo/neo/neo.csproj"
dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neo/neo/neo.csproj

# change neo-vm

echo ""
echo "==================================================="
echo "UPDATING REFERENCE OF PROJECT neo-vm INSIDE neo"
echo "==================================================="
echo ""
echo "dotnet remove /opt/neo/neo/neo.csproj package Neo.VM"
dotnet remove /opt/neo/neo/neo.csproj package Neo.VM

echo ""
echo "dotnet sln /opt/neo/neo.sln add /opt/neo-vm/src/neo-vm/neo-vm.csproj"
dotnet sln /opt/neo/neo.sln add /opt/neo-vm/src/neo-vm/neo-vm.csproj

echo ""
echo "dotnet add /opt/neo/neo/neo.csproj reference /opt/neo-vm/src/neo-vm/neo-vm.csproj"
dotnet add /opt/neo/neo/neo.csproj reference /opt/neo-vm/src/neo-vm/neo-vm.csproj



echo "ls /root/.nuget/packages"
ls /root/.nuget/

#dotnet restore /opt/neo-vm/src/neo-vm.UnitTests/neo-vm.UnitTests.csproj
echo ""
echo "dotnet test --verbosity n /opt/neo-vm/src/neo-vm.UnitTests/neo-vm.UnitTests.csproj"
###dotnet test --verbosity n --packages /opt/neo/packages /opt/neo/neo.UnitTests/neo.UnitTests.csproj
(cd /opt/neo-vm/tests && dotnet test --verbosity n --no-restore neo-vm.UnitTests/neo-vm.UnitTests.csproj)
echo ""

#dotnet restore /opt/neo/neo.UnitTests/neo.UnitTests.csproj
echo ""
echo "dotnet test --verbosity n /opt/neo/neo.UnitTests/neo.UnitTests.csproj"
#(cd /opt/neo/ && dotnet test --verbosity n --no-restore neo.UnitTests/neo.UnitTests.csproj)
echo ""


#(cd /opt/neo && dotnet clean)
#(cd /opt/neo-cli && dotnet clean)

#cd /opt/neo
#mkdir build
#rm -rf build/*
#dotnet restore
#msbuild /p:Configuration=Release
#cp neo/bin/Release/netstandard2.0/* build/

echo ""
echo "==================================================="
echo "BUILDING FINAL neo-cli"
echo "==================================================="
echo ""
echo ""
echo "dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64"
dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64 && cd /opt/neo-cli/neo-cli && zip -r /opt/build/neo-cli-built.zip neo-cli && echo "generated package: ./build/neo-cli-built.zip"

echo "finished!"
