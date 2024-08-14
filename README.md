# SMTP client in a docker container

Using this docker image, you can test SMTP servers within a docker-compose application.

The SMTP CLI client is [smtpc](https://github.com/msztolcman/smtpc), and the image is available on Docker Hub at [orwa84/smtpc](https://hub.docker.com/r/orwa84/smtpc), which is built for both Intel (amd64) and Apple Silicone (arm64) architectures.

## Setup

In order to use this repo to build a Docker image and publish it to Docker Hub (or any other registry), you must install the [`direnv` utility](https://direnv.net/).

After installing `direnv` and hooking it into your shell, you must create your own `.envrc` file at the root of the repository (see the provided example [`.envrc.example`](./.envrc.example)), and then, run the following command at least once:
```bash
direnv allow .
```

This will read the contents of the file `.envrc` provided, and convert them into variables in the environment. From this point on, navigating to the repo directory on your computer will automatically lead to defining these ENV variables (called the "build variables") in the shell.

## Build variables

| **Variable** | **Default** | **Description** |
|------|-----|--------------------|
| **SMTPC_IMAGE** | none | The image path on Docker Hub, usually in the format `$USER/$IMAGE` (e.g. _orwa84/smtpc_) |
| **PYTHON_TAG** | 3.12-slim | The tag to be used for the Python base image from the list of [available tags](https://hub.docker.com/_/python/tags) |

## Build script

To build the image using the variables provided, you can use the build script as follows:
```bash
./build.sh
```

Alternatively, it is also possible not to use the variables (not requiring `direnv` at all) and to pass the desired path for the Docker Hub image as a parameter to the script. For example:
```bash
./build.sh orwa84/smtpc
```

Note that this will not work in case the ENV variable **SMTPC_IMAGE** was defined, in which case the value of the ENV variable will be used instead of the passed parameter.

## Pushing to container registry

To push the image to Docker Hub as the _latest_ image, assuming that the image path is "orwa84/smtpc" and the python image tag is "3.12-slim", you can use the following commands:
```bash
docker tag orwa84/smtpc:3.12-slim orwa84/smtpc:latest
docker push -a orwa84/smtpc
```

In the above commands, the tag "latest" is added to the image, then the image is pushed to Docker Hub with all of the tags associated with it (using the `-a` CLI option).

## Questions or comments?

Please do not hesitate to [open an issue](https://github.com/diraneyya/smptc-docker/issues/new/choose) with any comments or suggestions you might have.

I also hope that you find the organization and the thought that went into this repository useful.