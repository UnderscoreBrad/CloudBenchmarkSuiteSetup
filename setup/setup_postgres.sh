#!/bin/bash

# creates the SQL database for pgbench to use

sudo -u postgres psql << EOF
DROP DATABASE example;
CREATE DATABASE example;
EOF

