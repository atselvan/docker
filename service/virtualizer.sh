#!/bin/bash
# https://github.com/dockersamples/docker-swarm-visualizer

# Variables
IMAGE="dockersamples/visualizer"
SERVICE_NAME="viz"
PORT="8086:8080"

EXISTING=`docker service ls | grep -c $SERVICE_NAME`
if [ $EXISTING -gt 0 ]
then
   echo "Removing $SERVICE_NAME service"
   docker service rm $SERVICE_NAME
fi

echo "Running a new service with name $SERVICE_NAME"
echo "[INFO] IMAGE   : $IMAGE"
echo "[INFO] NAME    : $SERVICE_NAME"
echo "[INFO] PORT    : $PORT"

docker service create \
  --name=$SERVICE_NAME \
  --publish=$PORT/tcp \
  --detach=true \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  $IMAGE