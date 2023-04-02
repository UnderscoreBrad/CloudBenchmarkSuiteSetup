#!/bin/bash

# creates two local webservers.
# one simple nodejs server (slower) on port 3000
# one from the nginx docker container on port 80
# this script should be run immediately before testing

node nodeserver.js || node setup/nodeserver.js &

docker run -p 80:80 nginx
