#!/bin/bash

echo "This script will download and install prerequisites and benchmarks before calling further scripts to complete setup."
echo "You may have to enter your user password during setup."
if [ "$EUID" -ne 0 ]; then
	echo "Please run this script with sudo or as root."
	exit 1
fi
echo "Press Enter to Continue."
read ans

startDir=$PWD

# Download & Install all packages available with apt
declare -a apt=(
"openjdk-19-jre-headless" 
"python3" 
"python3-pip" 
"nodejs" 
"postgresql" 
"postgresql-contrib" 
"git")

echo "== == INSTALLING PACKAGES FROM APT == =="
apt update
for x in ${apt[@]}; do
	echo "== == INSTALL REQUIREMENT: ${x} == =="
	apt install -y ${x} || echo "install failed: ${x}!\n Press Enter to Continue." read ans
done

# Download & Install Go
echo "== == DOWNLOADING AND INSTALLING GO == =="

goVersion="go1.20.2.linux-amd64"

mkdir temp && chmod 777 temp
wget -P temp/ "https://go.dev/dl/${goVersion}.tar.gz" &&
tar -C /usr/local/ -xzf "temp/${goVersion}.tar.gz" && rm temp/${goVersion}.tar.gz &&
rmdir temp
export PATH=$PATH:/usr/local/go/bin
go version && echo "Add the following line to your $HOME/.profile: 'export PATH=$PATH:/usr/local/go/bin' (you will be reminded later)" || 
echo "install failed: ${goVersion}! Press Enter to Continue." read ans

# Download & Install Bombardier HTTP Benchmark
go install github.com/codesenberg/bombardier@latest
bombardier --help || echo "Having issues with installing go. will have to troubleshoot before we can use Bombardier."


