#!/bin/bash

# creates the SQL database for pgbench to use

sudo -u postgres psql << EOF
CREATE DATABASE example;
EOF

