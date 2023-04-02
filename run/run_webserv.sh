#!/bin/bash

# the script setup/setup_webserv.sh must be run before this script.
# run.sh will do this automatically.

datetime=$(date +%F_%T)

mkdir autocannon && cd autocannon
mkdir ${datetime}_results && cd ${datetime}_results 
autocannon localhost:80 #&> test_nginx.txt 
autocannon localhost:3000 #&> test_nodejs.txt 

cd ..
