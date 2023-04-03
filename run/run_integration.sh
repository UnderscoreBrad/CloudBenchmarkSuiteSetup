#!/bin/bash

cd repos || cd .. && cd repos
cores=$(getconf _NPROCESSORS_ONLN)
datetime=$(date +%F_%T)

echo "multithreaded integration (C++)"
cd IntegrationMultiThreadTester
make all
mkdir ../../integration && mkdir ../../integration/${datetime}_results
./speedup.sh $cores 4000000000 &>> ../../integration/${datetime}_results/integrationCpp.txt

echo "single threaded integration (Java)"
cd ../SingleFunctionIntegration/src
javac Integrate.java
java Integrate --both -1 1 1000000000 8000 &>> ../../integration/${datetime}_results/integrationJava.txt
