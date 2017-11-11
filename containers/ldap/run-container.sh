#!/bin/bash

# Variables
IMAGE="h3nrik/apacheds"
NAME="ldap"
VOLUME="/data/ldap:/var/lib/apacheds-2.0.0-M20"
NETWORK="isolated_nw"
PORT="10389:10389"

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

docker container run --name $NAME -v $VOLUME -d -p $PORT --network=$NETWORK $IMAGE
