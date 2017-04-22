#Install Docker

##Docker CE for Ubuntu

Docker CE for Ubuntu is the best way to install the Docker platform on Ubuntu Linux environments. Simplify provisioning 
and setup of Docker and accelerate your time to value in building and deploying container based applications.

**Prerequisites**

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

sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl

Output:

root@osboxes:~# sudo apt-get -y install \
>   apt-transport-https \
>   ca-certificates \
>   curl
Reading package lists... Done
Building dependency tree
Reading state information... Done
ca-certificates is already the newest version (20160104ubuntu1).
ca-certificates set to manually installed.
apt-transport-https is already the newest version (1.3.4).
apt-transport-https set to manually installed.
curl is already the newest version (7.50.1-1ubuntu1.1).
curl set to manually installed.
The following package was automatically installed and is no longer required:
  ubuntu-core-launcher
Use 'sudo apt autoremove' to remove it.
0 to upgrade, 0 to newly install, 0 to remove and 5 not to upgrade.

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

Output:
root@osboxes:~# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
OK

sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

Output:
root@osboxes:~# sudo add-apt-repository \
>        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
>        $(lsb_release -cs) \
>        stable"

sudo apt-get update

Output:
root@osboxes:~# sudo apt-get update
Get:1 http://security.ubuntu.com/ubuntu yakkety-security InRelease [102 kB]
Hit:2 http://gb.archive.ubuntu.com/ubuntu yakkety InRelease
Get:3 http://gb.archive.ubuntu.com/ubuntu yakkety-updates InRelease [102 kB]
Get:4 http://gb.archive.ubuntu.com/ubuntu yakkety-backports InRelease [102 kB]
Get:5 https://download.docker.com/linux/ubuntu yakkety InRelease [20.1 kB]
Get:6 https://download.docker.com/linux/ubuntu yakkety/stable amd64 Packages [1,444 B]
Fetched 328 kB in 1s (265 kB/s)
Reading package lists... Done

2. Get Docker CEInstall the latest version of Docker CE on Ubuntu:
sudo apt-get -y install docker-ce

Output:
root@osboxes:~# sudo apt-get -y install docker-ce
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following package was automatically installed and is no longer required:
  ubuntu-core-launcher
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  aufs-tools cgroupfs-mount git git-man liberror-perl
Suggested packages:
  git-daemon-run | git-daemon-sysvinit git-doc git-el git-email git-gui gitk gitweb git-arch git-cvs git-mediawiki git-svn
The following NEW packages will be installed
  aufs-tools cgroupfs-mount docker-ce git git-man liberror-perl
0 to upgrade, 6 to newly install, 0 to remove and 5 not to upgrade.
Need to get 24.7 MB of archives.
After this operation, 133 MB of additional disk space will be used.
Get:1 http://gb.archive.ubuntu.com/ubuntu yakkety/universe amd64 aufs-tools amd64 1:3.2+20130722-1.1ubuntu1 [92.9 kB]
Get:2 http://gb.archive.ubuntu.com/ubuntu yakkety/universe amd64 cgroupfs-mount all 1.3 [5,778 B]
Get:3 http://gb.archive.ubuntu.com/ubuntu yakkety/main amd64 liberror-perl all 0.17024-1 [23.0 kB]
Get:4 http://gb.archive.ubuntu.com/ubuntu yakkety/main amd64 git-man all 1:2.9.3-1 [749 kB]
Get:5 http://gb.archive.ubuntu.com/ubuntu yakkety/main amd64 git amd64 1:2.9.3-1 [2,852 kB]
Get:6 https://download.docker.com/linux/ubuntu yakkety/stable amd64 docker-ce amd64 17.03.1~ce-0~ubuntu-yakkety [21.0 MB]
Fetched 24.7 MB in 7s (3,468 kB/s)
Selecting previously unselected package aufs-tools.
(Reading database ... 204078 files and directories currently installed.)
Preparing to unpack .../0-aufs-tools_1%3a3.2+20130722-1.1ubuntu1_amd64.deb ...
Unpacking aufs-tools (1:3.2+20130722-1.1ubuntu1) ...
Selecting previously unselected package cgroupfs-mount.
Preparing to unpack .../1-cgroupfs-mount_1.3_all.deb ...
Unpacking cgroupfs-mount (1.3) ...
Selecting previously unselected package docker-ce.
Preparing to unpack .../2-docker-ce_17.03.1~ce-0~ubuntu-yakkety_amd64.deb ...
Unpacking docker-ce (17.03.1~ce-0~ubuntu-yakkety) ...
Selecting previously unselected package liberror-perl.
Preparing to unpack .../3-liberror-perl_0.17024-1_all.deb ...
Unpacking liberror-perl (0.17024-1) ...
Selecting previously unselected package git-man.
Preparing to unpack .../4-git-man_1%3a2.9.3-1_all.deb ...
Unpacking git-man (1:2.9.3-1) ...
Selecting previously unselected package git.
Preparing to unpack .../5-git_1%3a2.9.3-1_amd64.deb ...
Unpacking git (1:2.9.3-1) ...
Setting up aufs-tools (1:3.2+20130722-1.1ubuntu1) ...
Setting up docker-ce (17.03.1~ce-0~ubuntu-yakkety) ...
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /lib/systemd/system/docker.service.
Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /lib/systemd/system/docker.socket.
Setting up git-man (1:2.9.3-1) ...
Processing triggers for ureadahead (0.100.0-19) ...
Setting up liberror-perl (0.17024-1) ...
Setting up cgroupfs-mount (1.3) ...
Processing triggers for libc-bin (2.24-3ubuntu2) ...
Processing triggers for systemd (231-9ubuntu3) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up git (1:2.9.3-1) ...
Processing triggers for ureadahead (0.100.0-19) ...
3. Test your Docker CE installationTest your installation:
sudo docker run hello-world

Output:
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/

Completely uninstall docker (not tried yet!!)

sudo apt-get purge docker-engine
sudo apt-get autoremove --purge docker-engine
rm -rf /var/lib/docker # This deletes all images, containers, and volumes


