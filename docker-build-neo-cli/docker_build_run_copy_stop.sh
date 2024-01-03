#!/bin/bash
#
# Build new neo-cli using new files of neo-blockchain
#
GETONLINEGITHUB=0
NEO2X="false"
ENVFILE="env-repositories.sh"

function usage {
    echo "Usage: $0 [--github] [--envfile <env.sh>] [--neo2x]"
}

# Order is important
while [[ "$#" > 0 ]]; do case $1 in
    --github)
	echo "PARAMETER GETONLINEGITHUB activated.";
        GETONLINEGITHUB=1
        shift
        ;;
    --envfile)
	echo "GETTING ENV FILE DEFINED IN THE COMMAND";
        ENVFILE=$2
        if [[ -z $ENVFILE ]]; then
            echo "Error: Please specify an env file"
            usage
            exit 1
        fi
        shift; shift
        ;;
    --neo2x)
	echo "Building NEO2X";
        NEO2X="true"
        shift; shift
        ;;
    *)
        usage
        exit 1
        ;;
  esac;
done

if ((!$GETONLINEGITHUB)); then
	source ./$ENVFILE
else
	source ./env-repositories-github.sh
fi

# ./env-repositories.sh is just an example file (a workaround) to by copied with the ADD command of the dockerfile in case no local files are going to be used
if [ "$LOCAL_NEO_CLI_BLOCKCHAIN" != "true" ] ; then
    LOCAL_NEO_CLI_BLOCKCHAIN_URL="./env-repositories.sh"
fi

if [ "$LOCAL_NEO_BLOCKCHAIN" != "true" ] ; then
    LOCAL_NEO_BLOCKCHAIN_URL="./env-repositories.sh"
fi

if [ "$LOCAL_NEO_PLUGINS" != "true" ] ; then
    LOCAL_NEO_PLUGINS_URL="./env-repositories.sh"
fi

if [ "$LOCAL_NEO_VM" != "true" ] ; then
    LOCAL_NEO_VM_URL="./env-repositories.sh"
fi

ARGS="--build-arg NEO_VM_URL=$NEO_VM_URL --build-arg NEO_CLI_BLOCKCHAIN_URL=$NEO_CLI_BLOCKCHAIN_URL  --build-arg NEO_CLI_BRANCH=$NEO_CLI_BRANCH --build-arg NEO_CLI_COMMIT=$NEO_CLI_COMMIT --build-arg NEO_BLOCKCHAIN_URL=$NEO_BLOCKCHAIN_URL --build-arg NEO_BLOCKCHAIN_BRANCH=$NEO_BLOCKCHAIN_BRANCH --build-arg NEO_BLOCKCHAIN_COMMIT=$NEO_BLOCKCHAIN_COMMIT --build-arg NEO_PLUGINS_URL=$NEO_PLUGINS_URL --build-arg NEO_PLUGINS_BRANCH=$NEO_PLUGINS_BRANCH --build-arg NEO_PLUGINS_COMMIT=$NEO_PLUGINS_COMMIT --build-arg LOCAL_NEO_BLOCKCHAIN=$LOCAL_NEO_BLOCKCHAIN --build-arg LOCAL_NEO_BLOCKCHAIN_URL=$LOCAL_NEO_BLOCKCHAIN_URL --build-arg NEO_BLOCKCHAIN_RUN_TESTS=$NEO_BLOCKCHAIN_RUN_TESTS --build-arg LOCAL_NEO_CLI_BLOCKCHAIN=$LOCAL_NEO_CLI_BLOCKCHAIN --build-arg LOCAL_NEO_CLI_BLOCKCHAIN_URL=$LOCAL_NEO_CLI_BLOCKCHAIN_URL --build-arg LOCAL_NEO_PLUGINS=$LOCAL_NEO_PLUGINS --build-arg LOCAL_NEO_PLUGINS_URL=$LOCAL_NEO_PLUGINS_URL --build-arg SET_NEO_VM=$SET_NEO_VM --build-arg NEO_VM_URL=$NEO_VM_URL --build-arg NEO_VM_BRANCH=$NEO_VM_BRANCH --build-arg NEO_VM_COMMIT=$NEO_VM_COMMIT --build-arg LOCAL_NEO_VM=$LOCAL_NEO_VM --build-arg LOCAL_NEO_VM_URL=$LOCAL_NEO_VM_URL --build-arg ENVFILE=$ENVFILE"

echo "Building ARGS are: $ARGS"

CONTAINER_NAME="neo-cli-csharp-builder-neo-tests"

echo "Delete previous .zip"
rm *.zip

DOCKERFILE="./Dockerfile"

if [ "$NEO2X" == "true" ] ; then
	DOCKERFILE="./Dockerfile_2x"
fi

echo "BUILDING neo cli with personalized characteristics... $DOCKERFILE"
docker build $ARGS -t $CONTAINER_NAME:latest -f $DOCKERFILE --progress=plain .

res=$?
if [ $res = 1 ]; then
    echo "EXITING AND NOT COPYING .ZIP Because last return was $res! Build probably had problems"
    exit 1
fi

echo "RUNNING container $PATH_CSHARP_NODE:"
echo $CONTAINER_NAME
docker run -d --name $CONTAINER_NAME --rm -h $CONTAINER_NAME $CONTAINER_NAME

#copy neo-cli-built.zip
echo "COPYING published zip file from container..."
docker cp $CONTAINER_NAME:/opt/neo-cli-built.zip ./neo-cli-built.zip

echo "STOPPING container"
docker stop $CONTAINER_NAME
