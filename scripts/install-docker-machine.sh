#!/bin/sh
#This script will install docker-machine in a linux server
#Run this script as a root use

#Install docker-machine
<<<<<<< HEAD
echo "Installing the version v0.12.0 of docker"
=======
echo "Installing the version v0.12.0 of docker-machine"
>>>>>>> 84ff5ceb59e0cff75162915e94c3f75dd4acc7ac
echo "=============================================="
curl -L https://github.com/docker/machine/releases/download/v0.12.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

#Check docker-machine version
echo "=============================================="
echo "Checking docker-machine version installed"
<<<<<<< HEAD
echo "==============================================
docker-machine version
=======
echo "=============================================="
docker-machine version
echo "=============================================="

>>>>>>> 84ff5ceb59e0cff75162915e94c3f75dd4acc7ac
