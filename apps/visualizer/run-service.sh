#!/bin/bash
# https://github.com/dockersamples/docker-swarm-visualizer

# Variables
VERSION="latest"
IMAGE="dockersamples/visualizer:latest"
SERVICE_NAME="visualizer"
PORT="9002:8080"
DOCKER_VOLUME="src=/var/run/docker.sock,dst=/var/run/docker.sock"

EXISTING=`docker service ls | grep -c $NAME`
if [ $EXISTING -gt 0 ]
then
   echo "Removing $NAME service"
   docker service rm $NAME
fi

echo "Running a new service with name $NAME"
echo "[INFO] IMAGE   : $IMAGE"
echo "[INFO] NAME    : $NAME"
echo "[INFO] PORT    : $PORT"

docker service create \
  --name=$NAME \
  --publish=$PORT/tcp \
  --detach=true \
  --constraint=node.role==manager \
  --mount=type=bind,$DOCKER_VOLUME\
  $IMAGE