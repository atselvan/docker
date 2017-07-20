#!/bin/sh
#This script will uninstall docker-machine from a linux server
#Run this script as a root user

#Uninstall docker-machine package
echo "Removing all the machines"
echo "=============================================="
docker-machine rm --force $(docker-machine ls -q)
echo "=============================================="

echo "Removing the docker-machine executable"
rm $(which docker-machine)
echo "=============================================="#Delete all images, containers, and volumes
echo "Deleting all the images, containers and volumes"
rm -rf /var/lib/docker

echo "docker-machine is uninstalled successfully..."
