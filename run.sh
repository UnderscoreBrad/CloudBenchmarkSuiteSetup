#!/bin/bash

# Run comprehensive benchmarks first
echo "begin running benchmarks. this will take a while."
curl -sL yabs.sh | bash
run/./run_integration.sh
run/./run_databases.sh
setup/./setup_webserv.sh > webserv_log.txt 2>&1 &
run/./run_webserv.sh
trap "exit" INT TERM
trap "kill 0" EXIT
