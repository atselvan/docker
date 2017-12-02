#!/bin/bash

# Variables
IMAGE="mysql"
NAME="mysql"
VOLUME="/Users/allanselvan/tools/mysql:/var/lib/mysql"
NETWORK="isolated_nw"
PORT="3306:3306"
ENVIRONMENT="MYSQL_ROOT_PASSWORD=welcome"

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

docker run --name $NAME -v $VOLUME -d -p $PORT -e $ENVIRONMENT --network=$NETWORK $IMAGE