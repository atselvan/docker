# Getting Started with Ubuntu

## Add a new user with sudo privileges

Login as a root user using the default username and password.

```sh
root@osboxes:~# useradd username

root@osboxes:~# usermod -G sudo username

root@osboxes:~# id username
uid=1002(username) gid=1002(username) groups=1002(username),27(sudo)

root@osboxes:~# passwd username
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
```

The new user will appear in the Ubuntu UI

![Alt text](images/ubuntu-getting-started-useradd.png)

## Update default software's

```sh
apt-get update
```

[...more information about apt-get update](./apt-get-update.md)

## Creating a /appl dirctory

sudo mkdir /appl
chown -R allan:root /appl

## Basic tool requirements

```sh
sudo apt-get -y install vim openssh-server openssh-client git yum yum-utils
```