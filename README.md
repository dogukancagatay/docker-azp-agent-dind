# Azure Devops Pipelines Agent Docker-in-Docker Image

Docker-in-Docker integrated Azure Devops Pipelines Agent image for self-hosted agents. It is based on [dcagatay/ubuntu-dind](https://hub.docker.com/r/dcagatay/ubuntu-dind) image. This image uses [s6-overlay](https://github.com/just-containers/s6-overlay) to run multiple services inside Docker container.

Image @DockerHub: [dcagatay/azp-agent-dind](https://hub.docker.com/r/dcagatay/azp-agent-dind).

## Tags

- `2.192.0`, `latest`
- `2.191.1`
- `2.190.0`
- `2.189.0`
- `2.188.4`
- `2.188.3`
- `2.187.2`

You can check all tags from [Docker Hub page](https://hub.docker.com/r/dcagatay/azp-agent-dind/tags?page=1&ordering=last_updated).

## Usage

### As Base Image

You can and should use it as a base image for your self-hosted agent and create your build environment.

### Running the Image

```
docker run -it --privileged dcagatay/azp-agent-dind:latest /bin/bash
```

### Environment Variables

- `DOCKER_EXTRA_OPTS`: Used to give arguments to `dockerd` command. Details can be found on its [reference](https://docs.docker.com/engine/reference/commandline/dockerd/). Default: `--log-level=error --experimental`

Environment variables specific to Azure Devops Pipelines Agent must be set, details are in its [docs](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#environment-variables).

## Build

You can build your own images specifying following build arguments.

- `AGENT_VERSION`: Azure Devops Agent version. Default `2.185.1`.

This image uses [dcagatay/ubuntu-dind:18.04](https://hub.docker.com/repository/docker/dcagatay/ubuntu-dind) as its base image, if you require more detailed build options, check its [docs](https://github.com/dogukancagatay/docker-ubuntu-dind).

## WARNING

The `--privileged` argument has security implications.
