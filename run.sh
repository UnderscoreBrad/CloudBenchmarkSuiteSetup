#!/bin/bash

# Run comprehensive benchmarks first
echo "begin running benchmarks. this will take a while."
curl -sL yabs.sh | bash
run/./run_integration.sh
run/./run_databases.sh
setup/./setup_webserv.sh > webserv_log.txt 2>&1 &
run/./run_webserv.sh
curl https://gist.githubusercontent.com/fantonatos/3c3e121ea068b2a507518d0f74dceca5/raw/89ea01e9109937eb38c1df896660c25ed69c1c5c/primes.c > primes.c && gcc -static -std=c99 -O3 -o primes primes.c -lm && strip ./primes && time ./primes
curl https://gist.githubusercontent.com/fantonatos/b48fdeab988adfd0bcf862f6daa60cee/raw/59f33ef8d016fb8a57e36798cd558f58ff48a2a2/mem.c > mem.c && gcc -static -std=c99 -O3 -o mem mem.c && strip ./mem && ./mem
trap "exit" INT TERM
trap "kill 0" EXIT
