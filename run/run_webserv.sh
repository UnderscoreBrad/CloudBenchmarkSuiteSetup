#!/bin/bash

# the script setup/setup_webserv.sh must be run before this script.
# run.sh will do this automatically.

public_ip=$(curl ifconfig.me)
url="http://${public_ip}"
echo "== == RUN AUTOCANNON BENCHMARKS == =="
autocannon localhost:80
autocannon localhost:3000
echo "== == RUN CASSOWARY BENCHMARKS == =="
docker run rogerw/cassowary:v0.14.1 -u ${url}:80 -c 10 -n 1000
#docker run rogerw/cassowary:v0.14.1 -u ${url}:3000 -c 10 -n 1000
