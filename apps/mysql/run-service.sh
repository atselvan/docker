#!/bin/bash
# Run mysql as a docker service
# Prerequisites:-
# Overlay network privatesquare and secrets mysql_root_password and
# mysql_password should be created before running the script
# /data/${NAME} path should exist on the source for the bind

# Variables
VERSION="5.7.21"
IMAGE="mysql:${VERSION}"
NAME="mysql"
VOLUME="source=/Users/allanselvan/data/$NAME,target=/var/lib/mysql"
NETWORK="privatesquare"
PORT="3306:3306"

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
echo "[INFO] NETWORK : $NETWORK"
echo "[INFO] PORT    : $PORT"

docker service create \
    --name=$NAME \
    --replicas 1 \
    --network privatesquare \
    --publish=$PORT/tcp \
    --detach=true \
    --constraint=node.role==manager \
    --mount=type=bind,$VOLUME\
    --secret source=mysql_root_password,target=mysql_root_password \
    --secret source=mysql_password,target=mysql_password \
    -e MYSQL_ROOT_PASSWORD_FILE="/run/secrets/mysql_root_password" \
    -e MYSQL_PASSWORD_FILE="/run/secrets/mysql_password" \
    -e MYSQL_USER="sonarqube" \
    -e MYSQL_DATABASE="sonarqube" \
    $IMAGE