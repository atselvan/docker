#!/bin/sh
#This script will uninstall docker-ce from a linux server
#Run this script as a root user

#Uninstall the Docker package
echo "Uninstalling Docker"
echo "=============================================="
apt-get purge docker-ce
echo "=============================================="

#Delete all images, containers, and volumes
echo "Deleting all the images, containers and volumes"
rm -rf /var/lib/docker

echo "Docker is uninstalled successfully..."