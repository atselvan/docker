#!/bin/sh
# Login to a docker container

CONTAINER_NAME=$1
echo ¨Logging into the container $CONTAINER_NAME¨ 
docker exec -it $CONTAINER_NAME bash
