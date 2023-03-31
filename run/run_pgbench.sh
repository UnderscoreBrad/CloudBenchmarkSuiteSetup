#!/bin/bash

cores=$(getconf _NPROCESSORS_ONLN)
transactions=$((1000000/$cores))
echo $transactions
#transactions= 10000000/$cores
# Run Database Benchmarks
# the default DB size is ~16MB, scale to 3.2GB.
# -i: initialize tables
# -c: specify number of clients
# -s: DB scale factor
mkdir pgbench
chmod 777 pgbench
sudo -u postgres pgbench -i -s 200 example
sudo -u postgres pgbench -n -c 10 -s 200 --jobs=${cores} --transactions=${transactions} example
