#!/bin/bash

cores=$(getconf _NPROCESSORS_ONLN)
transactionsA=$((100000/$cores))
transactionsB=$((1000000/$cores))
datetime=$(date +%F_%T)

# Run Database Benchmarks
# the default DB size is ~16MB, scale to 3.2GB.
# -i: initialize tables
# -c: specify number of clients
# -s: DB scale factor

mkdir pgbench
chmod 777 pgbench
cd pgbench
mkdir ${datetime}_results && cd ${datetime}_results

echo "test type: small (scale 50, 2 threads, 10000 transactions/thread)"
{ time sudo -u postgres pgbench -i -s 50 example; } &> test_small.txt 
{ time sudo -u postgres pgbench -c 10 -j 2 -t 10000 example; } &>> test_small.txt

echo "test type: medium (scale 200, max threads, 100000 transactions total)"
{ time sudo -u postgres pgbench -i -s 200 example; } &> test_medium.txt
{ time sudo -u postgres pgbench -c 10 --jobs=${cores} --transactions=${transactionsA} example; } &>> test_medium.txt

# echo "test type: LARGE (scale 200, max threads, 1000000 transactions total)"
# sudo -u postgres pgbench -i -s 200 example
# sudo -u postgres pgbench -c 10 --jobs=${cores} --transactions=${transactionsB} example

echo "tests completed."
