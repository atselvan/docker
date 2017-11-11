#!/bin/sh
#This script will install docker-machine in a linux server
#Run this script as a root use

#Install docker-machine
echo "Installing the version v0.12.0 of docker"
echo "=============================================="
curl -L https://github.com/docker/machine/releases/download/v0.12.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

#Check docker-machine version
echo "=============================================="
echo "Checking docker-machine version installed"
echo "==============================================
docker-machine version