# Install Docker

## Docker CE for Ubuntu

Docker CE for Ubuntu is the best way to install the Docker platform on Ubuntu Linux environments. Simplify provisioning 
and setup of Docker and accelerate your time to value in building and deploying container based applications.

### Prerequisites

To install Docker CE, you need the 64-bit version of one of these Ubuntu versions:

* Yakkety 16.10
* Xenial 16.04
* Trusty 14.04

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