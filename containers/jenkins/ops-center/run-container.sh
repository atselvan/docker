#!/bin/bash

# Variables
IMAGE="cloudbees/jenkins-operations-center"
NAME="jenkins-oc"
VOLUME="/Users/allanselvan/tools/$NAME:/var/jenkins_home"
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

docker run --name $NAME -v $VOLUME -d -p $PORT -p 7776:7776 --network=$NETWORK $IMAGE