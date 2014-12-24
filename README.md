#docker-atom-editor

##Overview

Install and run the [Atom editor](https://atom.io/) from within a Docker container.

##Building the image

Clone this repository, change into the source directory and run:

```
docker build .
```

##Running Atom

First up, you'll need to allow docker containers to access your X server. To do this run: 

```
xhost +
```

This allows *all* hosts access to the X server and thus isn't great for security. When you're done using your containers, it's a good idea to revoke access with:

```
xhost -
```

To launch Atom do:

```
docker pull jamesnetherton/docker-atom-editor

docker run -d -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
              -v /dev/shm:/dev/shm \
              -v ${PWD}/.atom:/.atom \
              -e DISPLAY=${DISPLAY} \
              jamesnetherton/docker-atom-editor
```

##Mit License

The MIT License (MIT)

Copyright (c) 2014 James Netherton

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
