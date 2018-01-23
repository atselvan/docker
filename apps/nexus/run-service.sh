#!/bin/bash

# Variables
VERSION="pro-2.14.5-02"
IMAGE="sonatype/nexus:${VERSION}"
NAME="nexus2"
VOLUME="source=/data/$NAME,target=/sonatype-work"
PORT="8081:8081"

EXISTING=`docker service ls | grep -c $NAME`
if [ $EXISTING -gt 0 ]
then
   echo "Removing $NAME service"
   docker service rm $NAME
fi

echo "Running a new service with name $NAME"
echo "[INFO] IMAGE   : $IMAGE"
echo "[INFO] NAME    : $NAME"
echo "[INFO] VOLUME  : $VOLUME"
echo "[INFO] PORT    : $PORT"

docker service create \
  --name=$NAME \
  --publish=$PORT/tcp \
  --detach=true \
  --constraint=node.role==manager \
  --mount=type=bind,$VOLUME\
  $IMAGE