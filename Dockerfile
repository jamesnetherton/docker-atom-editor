FROM ubuntu:12.04

ENV ATOM_VERSION v0.175.0

ADD build-atom.sh /usr/local/bin/build-atom.sh

RUN apt-get update && \
    apt-get install git npm libgnome-keyring-dev curl make g++ libgtk2.0-0 libxtst6 libnss3 libgconf-2-4 libasound2 fakeroot gconf2 libnotify4 gvfs-bin xdg-utils libcap2 -y && \
    git clone https://github.com/atom/atom /tmp/atom && \
    /bin/sh /usr/local/bin/build-atom.sh && \
    dpkg -i /tmp/atom-build/atom*.deb && \
    rm -rf /tmp/d-* /tmp/atom* && \
    apt-get clean

CMD ["/usr/local/bin/atom","-f"]
