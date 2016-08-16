# docker-atom-editor

## Overview

Install and run the [Atom editor](https://atom.io/) from within a Docker container.

## Building the image

Clone this repository, change into the source directory and run:

```
docker build . -t atom
```

## Running Atom

```
docker run -d -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
              -v /dev/shm:/dev/shm \
              -v ${HOME}/.atom:/.atom \
              -e DISPLAY=${DISPLAY} \
              jamesnetherton/docker-atom-editor
```
Note that `-v /dev/shm:/dev/shm` may be optionnal and can be replaced by `--shm-size="<number><unit>"`.

