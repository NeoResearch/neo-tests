#!/bin/bash

# remove neo-cli package and reference to local neo
echo "dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo"
dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo

echo "dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj"
dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj

echo "dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neo/neo/neo.csproj"
dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neo/neo/neo.csproj

#cd /opt/neo
#mkdir build
#rm -rf build/*
#dotnet restore
#msbuild /p:Configuration=Release
#cp neo/bin/Release/netstandard2.0/* build/

# publish
echo "dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64"
dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64

echo "cd /opt/neo-cli/neo-cli && zip -r /opt/build/neo-cli-built.zip neo-cli"
cd /opt/neo-cli/neo-cli && zip -r /opt/build/neo-cli-built.zip neo-cli
