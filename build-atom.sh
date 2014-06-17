#!/bin/bash
curl http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz > /tmp/node.tar.gz
cd /usr/local && tar --strip-components 1 -xzf /tmp/node.tar.gz && rm -f /tmp/node.tar.gz

cd /tmp/atom
git checkout v0.103.0
npm config set python /usr/bin/python2 -g
script/build
script/grunt install
script/grunt mkdeb 
