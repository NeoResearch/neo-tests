#!/bin/bash
MODULE_TEST_TO_INCLUDE=1

function usage {
    echo "Usage: $0 [--module-test-name <plugin to build>]"
}

while [[ "$#" > 0 ]]; do case $1 in
    -h)
        usage
        exit 0
        ;;
    --module-test-name)
	echo "GETTING PLUGIN TEST NAME AS PARAMETER $2";
        MODULE_TEST_TO_INCLUDE=$2
        shift; shift
        ;;
    *)
        usage
        exit 1
        ;;
  esac;
done

# dotnet test --verbosity n /opt/neo-modules/tests/$MODULE_TEST_TO_INCLUDE/$MODULE_TEST_TO_INCLUDE.csproj can be replated to just /opt/neo-modules/tests/$MODULE_TEST_TO_INCLUDE
echo ""
echo "dotnet test --verbosity n /opt/neo-modules/tests/$MODULE_TEST_TO_INCLUDE"
dotnet test --verbosity n /opt/neo-modules/tests/$MODULE_TEST_TO_INCLUDE
echo ""
