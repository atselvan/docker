#!/bin/bash

# Variables
VERSION="1.13.7"
IMAGE="nginx:$VERSION"
NAME="nginx-proxy"
VOLUME_CONF="/Users/allanselvan/data/nginx/conf/default.conf:/etc/nginx/conf.d/default.conf"
VOLUME_HTML="/Users/allanselvan/data/nginx/html:/usr/share/nginx/html"
NETWORK="isolated_nw"
PORT="80:80"

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

docker run --name $NAME -d -p $PORT -v $VOLUME_CONF -v $VOLUME_HTML --network=$NETWORK $IMAGE