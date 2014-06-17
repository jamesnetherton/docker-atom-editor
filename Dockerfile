FROM ubuntu:12.04

ADD build-atom.sh /usr/local/bin/build-atom.sh

RUN apt-get update 
RUN apt-get install git npm libgnome-keyring-dev curl make g++ libgtk2.0-0 libxtst6 libnss3 libgconf-2-4 libasound2 -y
RUN git clone https://github.com/atom/atom /tmp/atom
RUN /usr/local/bin/build-atom.sh
RUN dpkg -i /tmp/atom-build/atom*.deb
RUN rm -rf /tmp/d-* /tmp/atom*
RUN apt-get clean

CMD ["/usr/local/bin/atom","-f"]
