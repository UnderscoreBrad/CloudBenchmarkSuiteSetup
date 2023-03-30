#!/bin/bash

# Download & Install Go
echo "== == DOWNLOADING AND INSTALLING GO == =="

goVersion="go1.20.2.linux-amd64"

mkdir temp && chmod 777 temp
wget -P temp/ "https://go.dev/dl/${goVersion}.tar.gz" &&
tar -C /usr/local/ -xzf "temp/${goVersion}.tar.gz" && rm temp/${goVersion}.tar.gz &&
rmdir temp
export PATH=$PATH:/usr/local/go/bin
go version && echo "Add the following line to your $HOME/.profile: 'export PATH=$PATH:/usr/local/go/bin'" || 
echo "install failed: ${goVersion}!\n Press Enter to Continue." read ans

# Download & Install Bombardier HTTP Benchmark
go install github.com/codesenberg/bombardier@latest
bombardier --help || echo "Having issues with installing go. will have to troubleshoot before we can use Bombardier"
