#!/bin/bash

# Variables
IMAGE="sonatype/nexus:pro-2.14.5-02"
NAME="nexus2"
VOLUME="/data/$NAME:/sonatype-work"
NETWORK="isolated_nw"
PORT="8081:8081"

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

docker run --name $NAME -v $VOLUME -d -p $PORT --network=$NETWORK $IMAGE