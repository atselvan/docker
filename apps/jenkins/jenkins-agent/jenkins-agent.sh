#!/usr/bin/env bash

# Parameters
ACTION_DEFAULT="create"
ACTION="${1:-$ACTION_DEFAULT}"

# Network params
OVERLAY_NETWORK=privatesquare
PROXY_NETWORK=proxy

# JENKINS SLAVE SERVICE
SERVICE_NAME=jenkins-slave-service
IMAGE=vfarcic/jenkins-swarm-agent
NUMBER_OF_EXECUTORS=1
SLAVE_LABEL=docker

# Jenkins ST M01
JENKINS_MASTER_HOST=cicd.privatesquare.in
#JENKINS_MASTER_URL="http://${JENKINS_MASTER_IP}:8080/jenkins"
JENKINS_MASTER_URL="http://${JENKINS_MASTER_HOST}:8080"
######################################

echo "================================"
case $ACTION in
    rm )
        echo "Removing service ${SERVICE_NAME}"
        docker service rm ${SERVICE_NAME}
    ;;
    create )
        echo "Creating ${SERVICE_NAME} service and ${OVERLAY_NETWORK} overlay network"
        docker network ls | grep ${OVERLAY_NETWORK}
        RC=$?
        if [ $RC != 0 ]; then
            echo "Creating overlay network ${OVERLAY_NETWORK}"
            docker network create \
            --driver overlay ${OVERLAY_NETWORK}
        else
            echo "Overlay network ${OVERLAY_NETWORK} already exists"
        fi

        #########################################
        ######## Jenkins Slave Service 1 ########
        #########################################
        EXISTING_SERVICE=`docker service ls | grep -c ${SERVICE_NAME}`
        if [ ${EXISTING_SERVICE} -gt 0 ]
        then
            echo "Service ${SERVICE_NAME} already exists. Not creating a new service"
        else
            echo "Creating service ${SERVICE_NAME}"
            docker service create --name ${SERVICE_NAME} \
            -e COMMAND_OPTIONS="\
            -master ${JENKINS_MASTER_URL} \
            -labels ${SLAVE_LABEL} -executors ${NUMBER_OF_EXECUTORS} \
            -mode exclusive" \
            --mode global \
            --constraint 'node.role==worker' \
            --mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
            --mount "type=bind,source=/tmp,target=/workspace" \
            ${IMAGE}
        fi
        ##########################################
        ##########################################
    ;;
    * )
        echo "$ACTION unknown, valid actions are [create, rm]"
        exit
    ;;
esac
echo "================================"

#--secret source=SOLO_JENKINS_AGENT_USERNAME,target=SOLO_JENKINS_AGENT_USERNAME \
#--secret source=SOLO_JENKINS_AGENT_PASSWORD,target=SOLO_JENKINS_AGENT_PASSWORD \
#-e USER_NAME_SECRET="/run/secrets/SOLO_JENKINS_AGENT_USERNAME" \
#-e PASSWORD_SECRET="/run/secrets/SOLO_JENKINS_AGENT_PASSWORD" \