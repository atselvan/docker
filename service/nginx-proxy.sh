#!/bin/bash
# https://github.com/dockersamples/docker-swarm-visualizer

# Variables
IMAGE="nginx-proxy"
SERVICE_NAME="nginx-proxy"
network="ats-ci"
PORT="80:80"

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
echo "[INFO] NETWORK : $NETWORK"

docker container run \
  --name $SERVICE_NAME \
  --publish $PORT \
  
  $IMAGE