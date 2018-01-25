#!/bin/bash

# Variables
VERSION="2.89.1.6"
IMAGE="cloudbees/jenkins-operations-center:$VERSION"
NAME="jenkins-oc"
VOLUME="/Users/allanselvan/data/$NAME:/var/jenkins_home"
DOCKER_VOLUME="/var/run/docker.sock:/var/run/docker.sock"
NETWORK="isolated_nw"
PORT="8888:8080"

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

docker run --name $NAME -v $VOLUME -v $DOCKER_VOLUME -d -p $PORT -p 7776:7776 --network=$NETWORK $IMAGE