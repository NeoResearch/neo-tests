#!/bin/bash

# remove neo-cli package and reference to local neo
dotnet remove /opt/neo-cli/neo-cli/neo-cli.csproj package neo
dotnet sln /opt/neo-cli/neo-cli.sln add /opt/neo/neo/neo.csproj
dotnet add /opt/neo-cli/neo-cli/neo-cli.csproj reference /opt/neo/neo/neo.csproj

#cd /opt/neo
#mkdir build
#rm -rf build/*
#dotnet restore
#msbuild /p:Configuration=Release
#cp neo/bin/Release/netstandard2.0/* build/

# publish
dotnet publish /opt/neo-cli/neo-cli/neo-cli.csproj -o neo-cli -c Release -r ubuntu.16.04-x64
cd /opt/neo-cli/neo-cli && zip -r /opt/build/neo-cli-built.zip neo-cli
