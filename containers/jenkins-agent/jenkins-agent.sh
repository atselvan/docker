#!/usr/bin/env bash

# Parameters
ACTION_DEFAULT="create"
ACTION="${1:-$ACTION_DEFAULT}"
LOG_PREFIX=ATS-JKS
PREFIX=ats

# Network params
OVERLAY_NETWORK=ats-ci
PROXY_NETWORK=proxy

# JENKINS SLAVE SERVICE
JENKINS_SLAVE_SERVICE=${PREFIX}-jenkins-slave-service
JENKINS_SLAVE_IMAGE=vfarcic/jenkins-swarm-agent
NUMBER_OF_EXECUTORS=2
SLAVE_LABEL=docker
GIT_LOCATION=/usr/bin/git

# Jenkins ST M01
JENKINS_MASTER_URL=ci.ats.in
######################################

echo "================================"
case $ACTION in
    rm )
        echo "[$LOG_PREFIX] removing Jenkins Slave Service"
        docker service rm $JENKINS_SLAVE_SERVICE
    ;;
    create )
        echo "[$LOG_PREFIX] creating Jenkins Slave Service and overlay network"
        docker network ls | grep $OVERLAY_NETWORK
        RC=$?
        if [ $RC != 0 ]; then
            echo "[$LOG_PREFIX] creating overlay network $OVERLAY_NETWORK"
            docker network create \
            --driver overlay \
            $OVERLAY_NETWORK
        else
            echo "[$LOG_PREFIX] overlay network $OVERLAY_NETWORK already exists"
        fi

        #####################################
        #### Jenkins Slave Service 1
        #####################################
        EXISTING_SERVICE=`docker service ls | grep -c $JENKINS_SLAVE_SERVICE`
        if [ $EXISTING_SERVICE -gt 0 ]
        then
            echo "[${LOG_PREFIX}] service $JENKINS_SLAVE_SERVICE already exists. Do not create a new service"
        else
            echo "[$LOG_PREFIX] creating $JENKINS_SLAVE_SERVICE"
            docker service create --name $JENKINS_SLAVE_SERVICE \
            -e COMMAND_OPTIONS="\
            -t GIT=$GIT_LOCATION \
            -master http://${JENKINS_MASTER_URL}:8080/jenkins \
            -labels $SLAVE_LABEL -executors $NUMBER_OF_EXECUTORS \
            -mode exclusive" \
            --mode global \
            --mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
            --mount "type=bind,source=/tmp,target=/workspace" \
            $JENKINS_SLAVE_IMAGE
        fi
        ######################################
        ######################################
    ;;
    * )
        echo "[$LOG_PREFIX] $ACTION unknown, valid actions are [create, rm]"
        exit
    ;;
esac
echo "================================"
echo "================================"

#--secret source=SOLO_JENKINS_AGENT_USERNAME,target=SOLO_JENKINS_AGENT_USERNAME \
#--secret source=SOLO_JENKINS_AGENT_PASSWORD,target=SOLO_JENKINS_AGENT_PASSWORD \
#-e USER_NAME_SECRET="/run/secrets/SOLO_JENKINS_AGENT_USERNAME" \
#-e PASSWORD_SECRET="/run/secrets/SOLO_JENKINS_AGENT_PASSWORD" \
# --constraint 'node.role==worker' \