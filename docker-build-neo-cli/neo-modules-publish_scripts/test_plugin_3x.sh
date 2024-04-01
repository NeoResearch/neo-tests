#!/bin/bash
TESTS_FOLDER=/opt/neo-modules/tests
COVERAGE_OUTPUT_FOLDER=/opt/neo-modules/coverage-join
COVERAGE_FILE_NAME=coverage.net8.0.json
EXCLUDED_TESTS=\"[Neo]*,[Neo.IO]*,[Neo.Json]*,[Neo.VM]*,[Neo.Extensions]*,[Neo.Cryptography.BLS12_381]*\"
DOTNET_TEST_COMMAND="dotnet test --framework net8.0"

echo "========= INSTALLING PACKAGE COVERLET.MSBUILD WITH FIND ============"
find $TESTS_FOLDER -name *.csproj | xargs -I % dotnet add % package coverlet.msbuild

echo ""
echo "========= dotnet test FOR $TESTS_FOLDER ============"
$DOTNET_TEST_COMMAND $TESTS_FOLDER/Neo.Network.RPC.Tests  /p:CollectCoverage=true /p:CoverletOutput=${COVERAGE_OUTPUT_FOLDER}/ -p:Exclude=${EXCLUDED_TESTS}

$DOTNET_TEST_COMMAND $TESTS_FOLDER/Neo.Plugins.RpcServer.Tests /p:CollectCoverage=true /p:CoverletOutput=${COVERAGE_OUTPUT_FOLDER}/ /p:MergeWith=$COVERAGE_OUTPUT_FOLDER/$COVERAGE_FILE_NAME -p:Exclude=${EXCLUDED_TESTS}

$DOTNET_TEST_COMMAND $TESTS_FOLDER/Neo.Plugins.Storage.Tests /p:CollectCoverage=true /p:CoverletOutput=${COVERAGE_OUTPUT_FOLDER}/ /p:MergeWith=$COVERAGE_OUTPUT_FOLDER/$COVERAGE_FILE_NAME -p:Exclude=${EXCLUDED_TESTS}

$DOTNET_TEST_COMMAND $TESTS_FOLDER/Neo.Cryptography.MPTTrie.Tests /p:CollectCoverage=true /p:CoverletOutput=${COVERAGE_OUTPUT_FOLDER}/ /p:MergeWith=$COVERAGE_OUTPUT_FOLDER/$COVERAGE_FILE_NAME -p:Exclude=${EXCLUDED_TESTS}

$DOTNET_TEST_COMMAND $TESTS_FOLDER/Neo.Plugins.OracleService.Tests /p:CollectCoverage=true /p:CoverletOutput==${COVERAGE_OUTPUT_FOLDER}/coverage/lcov  /p:MergeWith=$COVERAGE_OUTPUT_FOLDER/$COVERAGE_FILE_NAME -p:Exclude=${EXCLUDED_TESTS} /p:CoverletOutputFormat=lcov
        
echo ""
