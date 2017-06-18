# Docker Swarm

## Initialising Swarm mode

https://docs.docker.com/engine/reference/commandline/swarm_init/

allan@osboxes:~$ docker swarm init --advertise-addr 192.168.2.13
Swarm initialized: current node (g175fujzdclebxdxfayftmauh) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-3hgpyg71hltawv0a1scqw6deuvpzhaolcljjtejb4h48mgki13-7xajhur4h6y44zhlh5z33d2oy \
    192.168.2.13:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

Docker service

Before
allan@osboxes:~$ docker service ls
Error response from daemon: This node is not a swarm manager. Use "docker swarm init" or "docker swarm join" to connect this node to swarm and try again.

After
allan@osboxes:~$ docker service ls
ID  NAME  MODE  REPLICAS  IMAGE




