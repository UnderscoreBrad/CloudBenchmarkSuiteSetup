#!/bin/bash

cd repos || cd .. && cd repos
cores=$(getconf _NPROCESSORS_ONLN)

echo "multithreaded integration (C++)"
cd IntegrationMultiThreadTester
make all
./speedup.sh $cores 4000000000

echo "single threaded integration (Java)"
cd ../SingleFunctionIntegration/src
javac Integrate.java
java Integrate --both -1 1 1000000000 8000
