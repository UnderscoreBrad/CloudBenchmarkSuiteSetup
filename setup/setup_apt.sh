#!/bin/bash

# Download & Install all packages available with apt
declare -a apt=(
"openjdk-17-jdk-headless" 
"python3" 
"python3-pip" 
"nodejs"
"npm" 
"postgresql" 
"postgresql-contrib" 
"git")

echo "== == INSTALLING PACKAGES FROM APT == =="
apt update
for x in ${apt[@]}; do
	echo "== == INSTALL REQUIREMENT: ${x} == =="
	apt install -y ${x} || echo "install failed: ${x}!\n Press Enter to Continue." read ans
done
