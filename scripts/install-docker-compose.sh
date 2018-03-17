#!/bin/bash
#This script will install docker-compose in a linux server
#Run this script as a root use

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#Install docker-compose
echo "Installing the version 1.15.0-rc1 of docker-compose"
echo "=============================================="
curl -L https://github.com/docker/compose/releases/download/1.15.0-rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#Check docker-compose version
echo "=============================================="
echo "Checking docker-compose version installed"
echo "=============================================="
docker-compose version
echo "=============================================="