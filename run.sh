#!/bin/bash

# Run comprehensive benchmarks first
#curl -sL yabs.sh | bash
setup/./setup_webserv.sh > /dev/null 2>&1 &
run/./run_webserv.sh

