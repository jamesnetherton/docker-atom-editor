docker run -d -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
              -v /dev/shm:/dev/shm \
              -v ${HOME}/.atom:/home/atom/.atom \
              -e DISPLAY \
              jamesnetherton/docker-atom-editor
