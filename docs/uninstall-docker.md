# [Completely uninstall docker](../scripts/uninstall-docker.sh)

## Uninstall steps

```sh
sudo apt-get purge docker-engine
sudo apt-get autoremove --purge docker-engine
rm -rf /var/lib/docker # This deletes all images, containers, and volumes
```