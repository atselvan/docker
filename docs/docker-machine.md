<<<<<<< HEAD
What is Docker Machine?Docker Machine is a tool that lets you install Docker Engine on virtual hosts, and manage the hosts with docker-machine commands. You can use Machine to create Docker hosts on your local Mac or Windows box, on your company network, in your data center, or on cloud providers like AWS or Digital Ocean.
Using docker-machine commands, you can start, inspect, stop, and restart a managed host, upgrade the Docker client and daemon, and configure a Docker client to talk to your host.

Install Docker Machine on Linux

curl -L https://github.com/docker/machine/releases/download/v0.10.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && chmod +x /tmp/docker-machine && sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

output:
root@osboxes:/appl/template# curl -L https://github.com/docker/machine/releases/download/v0.10.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
>   chmod +x /tmp/docker-machine &&
>   sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   600    0   600    0     0    241      0 --:--:--  0:00:02 --:--:--   241
100 24.1M  100 24.1M    0     0  2665k      0  0:00:09  0:00:09 --:--:-- 5643k

root@osboxes:/appl/template# docker-machine version
docker-machine version 0.10.0, build 76ed2a6

docker-machine create -d virtualbox --virtualbox-no-vtx-check 

Waiting for an IP...
Error creating machine: Error in driver during machine creation: Too many retries waiting for SSH to be available.  Last error: Maximum number of retries (60) exceeded



=======
# Docker Machine

## Overview

What is Docker Machine?Docker Machine is a tool that lets you install Docker Engine on virtual hosts, and manage the hosts with docker-machine commands. You can use Machine to create Docker hosts on your local Mac or Windows box, on your company network, in your data center, or on cloud providers like AWS or Digital Ocean.
Using docker-machine commands, you can start, inspect, stop, and restart a managed host, upgrade the Docker client and daemon, and configure a Docker client to talk to your host.

## Install Docker Machine

Download the Docker Machine binary and extract it to your PATH.

```sh
curl -L https://github.com/docker/machine/releases/download/v0.12.1/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-m
```

## Uninstall Docker Machine

To uninstall Docker Machine:

Remove the executable: rm $(which docker-machine)
Optionally, remove the machines you created:

* To remove each machine individually: docker-machine rm <machine-name>
* To remove all machines: docker-machine rm -f $(docker-machine ls -q)

[...more information](https://docs.docker.com/machine/install-machine/#how-to-uninstall)
>>>>>>> 84ff5ceb59e0cff75162915e94c3f75dd4acc7ac
