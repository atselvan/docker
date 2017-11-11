https://github.com/dockersamples/docker-swarm-visualizer

docker service create \
  --name=viz \
  --publish=8086:8080/tcp \
  --env CTX_ROOT=/visualizer \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer