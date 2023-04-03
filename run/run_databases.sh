#!/bin/bash

cores=$(getconf _NPROCESSORS_ONLN)
transactionsA=$((100000/$cores))
transactionsB=$((1000000/$cores))

# Run Database Benchmarks
# the default DB size is ~16MB, scale to 3.2GB.
# -i: initialize tables
# -c: specify number of clients
# -s: DB scale factor
echo "== == RUN PGBENCH == =="

echo "test type: PGBench - small (scale 50, 2 threads, 10000 transactions/thread)"
time sudo -u postgres pgbench -i -s 50 example 
time sudo -u postgres pgbench -c 10 -j 2 -t 10000 example

echo "test type: PGBench - medium (scale 200, max threads, 100000 transactions total)"
time sudo -u postgres pgbench -i -s 200 example
time sudo -u postgres pgbench -c 10 --jobs=${cores} --transactions=${transactionsA} example

# echo "test type: PGBench - LARGE (scale 200, max threads, 1000000 transactions total)"
# sudo -u postgres pgbench -i -s 200 example
# sudo -u postgres pgbench -c 10 --jobs=${cores} --transactions=${transactionsB} example

echo "test type: HammerDB (docker container)"
#cd ..
#mkdir HammerDB
#cd HammerDB
#docker pull tpcorg/hammerdb
#docker build -t tpcorp/hammerdb .
#docker run -it --name tpcorp/hammerdb tpcorp/hammerdb bash

echo "tests completed."
