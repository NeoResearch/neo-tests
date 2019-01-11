#!/bin/bash
echo "Building ubuntu-dotnet dependent image"
#(cd ../docker-ubuntu-dotnet; ./docker_build.sh)

docker build -t neo-opt-compiler .
