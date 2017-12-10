#!/bin/bash

# Variables
IMAGE="elasticsearch:1.7.6"
NAME="elasticsearch"
VOLUME="/Users/allanselvan/tools/$NAME:/usr/share/elasticsearch/data"
NETWORK="isolated_nw"
PORT1="9200:9200"
PORT2="9300:9300"

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
echo "[INFO] PORT    : $PORT1 | $PORT2"

docker run --name $NAME -v $VOLUME -d -p $PORT1 -p $PORT2 --network=$NETWORK $IMAGE
