# Jenkins Master

## Jenkins

See [Jenkins](https://hub.docker.com/r/jenkinsci/jenkins/).

## Configuration

As we expect a new Jenkins Master to come with a pre-defined list of plugins, we have this derived image.
The list if plugins can be found in plugins.txt.

If you're unsure which plugins you really want, you can create a clean Jenkins 2 container.
Then install the plugins you want and use the get-plugins.sh script to generate the plugins.txt file yourself.