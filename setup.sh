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

chmod a+x setup/setup_apt.sh
chmod a+x setup/setup_docker.sh
chmod a+x setup/setup_git.sh
chmod a+x setup/setup_go.sh
chmod a+x setup/setup_postgres.sh
chmod a+x setup/setup_webserv.sh 

# webserver is not run until needed

setup/./setup_apt.sh
setup/./setup_docker.sh
setup/./setup_git.sh
setup/./setup_go.sh
setup/./setup_postgres.sh

npm install autocannon -g



