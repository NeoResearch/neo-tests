#!/bin/bash
IMAGE_NAME="neo-opt-compiler"

# neo-core 2.7.4 ~ cae8575c29ba76709dfa3962501011390fda7c8b
# neo-cli 2.7.4: tag v2.7.4
# hexdump -v -C neo-cli.dll  > neo-cli.hex
# diff neo-cli-274/neo-cli.hex neo-cli-built/neo-cli.hex (few bytes difference)


NEO_BRANCH=b0b0646
NEO_CLI_BRANCH=5eb133e
git clone https://github.com/neo-project/neo-cli.git neo-cli && git checkout $NEO_CLI_BRANCH
git clone https://github.com/neo-project/neo.git neo-core && cd /opt/neo && git checkout $NEO_BRANCH

echo "Starting container..."
#docker run --rm --volume neo-code:/neo-code --name $IMAGE_NAME -it /bin/bash
echo "docker run --rm --volume=`pwd`/neo-core:/opt/neo --volume=`pwd`/neo-cli:/opt/neo-cli --volume=`pwd`/build:/opt/build  neo-opt-compiler -t"
docker run --rm --volume=`pwd`/neo-core:/opt/neo --volume=`pwd`/neo-cli:/opt/neo-cli --volume=`pwd`/build:/opt/build  neo-opt-compiler -t
