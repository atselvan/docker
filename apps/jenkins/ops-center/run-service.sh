#!/bin/bash

# Variables
VERSION="2.89.1.6"
IMAGE="cloudbees/jenkins-operations-center:$VERSION"
NAME="jenkins-oc"
VOLUME="source=/data/$NAME,destination=/var/jenkins_home"
DOCKER_VOLUME="source=/var/run/docker.sock,destination=/var/run/docker.sock"
NETWORK="privatesquare"
PORT="8888:8080"
PORT1="7776:7776"

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
  --publish=$PORT1/tcp \
  --detach=true \
  --constraint=node.role==manager \
  --mount=type=bind,$VOLUME\
  --mount=type=bind,$DOCKER_VOLUME\
  $IMAGE