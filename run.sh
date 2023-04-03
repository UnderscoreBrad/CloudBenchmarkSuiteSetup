#!/bin/bash

# Run comprehensive benchmarks first
echo "begin running benchmarks. this will take a while."
cd run && curl -sL yabs.sh | bash

./run_integration.sh
./run_databases.sh && cd ..
setup/./setup_webserv.sh > /dev/null 2>&1 &
cd run && ./run_webserv.sh && cd ..

echo "benchmarks completed. results can be found in the corresponding directories."
