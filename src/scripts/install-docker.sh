#!/bin/sh
#This script will install docker-ce in a linux server
#Run this script as a root user

#Set up the Docker CE repository on Ubuntu
echo "Installing packages to allow apt to use a repository over HTTPS"
apt-get -y install \
apt-transport-https \
ca-certificates \
curl

#Add Docker’s official GPG key
echo "Adding Docker’s official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

#Use the following command to set up the stable repository.
#You always need the stable repository, even if you want to install edge builds as well.
echo "Executing command to set up a stable repository"
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

#Update the apt package index
echo "Updating the apt package index."
echo "=============================================="
apt-get update
echo "=============================================="

#Install docker
echo "Installing the latest version of docker"
echo "=============================================="
apt-get -y install docker-ce
echo "=============================================="
echo "The Docker daemon will start automatically..."


#Check docker version
echo "=============================================="
echo "Checking docker version installed"
echo "=============================================="

docker version
#Verify Docker CE installation
echo "Testing the docker instance"
echo "=============================================="
docker run hello-world
echo "=============================================="

#Verify Docker CE installation
echo "Docker is installed successfully..."
