  #!/bin/bash
  echo "make sure to run mongod in a separate terminal window before running this script."
  ./bin/ycsb load mongodb -s -P workloads/workloada -p recordcount=500000 -threads 16 -p mongodb.url="mongodb://localhost:27017/admin"
  ./bin/ycsb run mongodb -s -P workloads/workloada -p mongodb.url="mongodb://localhost:27017/admin" -p operationcount=5000000 -threads 16
