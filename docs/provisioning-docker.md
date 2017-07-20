# [Provisioning Docker]

## Docker CE for Ubuntu

Docker CE for Ubuntu is the best way to install the Docker platform on Ubuntu Linux environments. Simplify provisioning and setup of Docker and accelerate your time to value in building and deploying container based applications.

### Prerequisites

To install Docker CE, you need the 64-bit version of one of these Ubuntu versions:

* Yakkety 16.10
* Xenial 16.04
* Trusty 14.04

### [Install docker](../scripts/install-docker.sh)

To check which version of ubuntu is installed on your system run the command: 

```sh
allan@osboxes:~$ lsb_release -cs
yakkety
```

1. Set up the repository

Set up the Docker CE repository on Ubuntu.

```sh
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl
```

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

```sh
sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
```

```sh
sudo apt-get update
```

2. Get Docker CE

Install the latest version of Docker CE on Ubuntu:

```sh
sudo apt-get -y install docker-ce
```

3. Test your Docker CE installation

```sh
sudo docker run hello-world
```

## Run docker as a non root user

Add the docker group if it doesn't already exist:

```sh
sudo groupadd docker
```

Add the connected user "$USER" to the docker group. Change the user name to match your preferred user if you do not want to use your current user:

```sh
sudo gpasswd -a $USER docker
```

Either do a newgrp docker or log out/in to activate the changes to groups.
You can use

```sh
docker run hello-world
```

to check if you can run docker without sudo

## [Uninstall steps](../scripts/uninstall-docker.sh)

```sh
sudo apt-get purge docker-engine
sudo apt-get autoremove --purge docker-engine
rm -rf /var/lib/docker # This deletes all images, containers, and volumes
```