#!/bin/bash

# Variables
IMAGE="jboss/keycloak"
NAME="keycloak"
NETWORK="privatesquare"
PORT="8080:8080"

RUNNING=`docker ps | grep -c $NAME`
if [ $RUNNING -gt 0 ]
then
   echo "Stopping $NAME instance"
   docker stop $NAME
fi

EXISTING=`docker ps -a | grep -c $NAME`
if [ $EXISTING -gt 0 ]
then
   echo "Removing $NAME container"
   docker rm $NAME
fi

echo "Running a new instance with name $NAME"
echo "[INFO] IMAGE   : $IMAGE"
echo "[INFO] NAME    : $NAME"
echo "[INFO] VOLUME  : $VOLUME"
echo "[INFO] NETWORK : $NETWORK"
echo "[INFO] PORT    : $PORT"

docker run --name $NAME -d -p $PORT -e KEYCLOAK_USER=atselvan -e KEYCLOAK_PASSWORD=welkom --network=$NETWORK $IMAGE