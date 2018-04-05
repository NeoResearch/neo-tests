CONTAINER_NAME="neo-privatenet-neoresearch-integrations"
DOCKER_PRIVATENET_INTEGRATION=$(docker ps -aqf name=$CONTAINER_NAME)

if [ -z ${DOCKER_PRIVATENET_INTEGRATION+x} ]; then 
   echo "DOCKER_PRIVATENET_INTEGRATION var is unset";
else
   echo "DOCKER_PRIVATENET_INTEGRATION=$DOCKERPRIV";
   docker exec -it $CONTAINER_NAME /bin/bash
fi
