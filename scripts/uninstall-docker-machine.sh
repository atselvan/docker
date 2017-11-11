#!/bin/sh
#This script will uninstall docker-machine from a linux server
#Run this script as a root user

#Uninstall docker-machine package
echo "Removing all the machines"
echo "=============================================="
<<<<<<< HEAD
docker-machine rm -f $(docker-machine ls -q)
=======
docker-machine rm --force $(docker-machine ls -q)
>>>>>>> 84ff5ceb59e0cff75162915e94c3f75dd4acc7ac
echo "=============================================="

echo "Removing the docker-machine executable"
rm $(which docker-machine)
echo "=============================================="#Delete all images, containers, and volumes
echo "Deleting all the images, containers and volumes"
rm -rf /var/lib/docker

<<<<<<< HEAD
echo "docker-machine is uninstalled successfully..."
=======
echo "docker-machine is uninstalled successfully..."
>>>>>>> 84ff5ceb59e0cff75162915e94c3f75dd4acc7ac
