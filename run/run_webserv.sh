#!/bin/bash

# the script setup/setup_webserv.sh must be run before this script.
# run.sh will do this automatically.

datetime=$(date +%F_%T)

mkdir webservers && cd webservers
mkdir ${datetime}_results && cd ${datetime}_results 
autocannon localhost:80 &> test_nginx_autocannon.txt 
autocannon localhost:3000 &> test_nodejs_autocannon.txt 
cd ..
docker run rogerw/cassowary:v0.14.1 -u http://localhost:80 -c 10 -n 1000 &> test_nginx_cassowary.txt
docker run rogerw/cassowary:v0.14.1 -u http://localhost:3000 -c 10 -n 1000 &> test_nodejs_cassowary.txt
