CONTAINER_NAME="neo-privatenet-opt-tests"
DOCKER_PRIVATENET_OPT_TESTS=$(docker ps -aqf name=$CONTAINER_NAME)

if [ -z ${DOCKER_PRIVATENET_OPT_TESTS+x} ]; then 
   echo "DOCKER_PRIVATENET_OPT_TESTS var is unset";
else
   echo "DOCKER_PRIVATENET_OPT_TESTS=$DOCKER_PRIVATENET_OPT_TESTS";
   docker exec -it $CONTAINER_NAME /bin/bash
fi
