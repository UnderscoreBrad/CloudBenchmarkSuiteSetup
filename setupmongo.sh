#!/bin/bash

apt-get install gnupg
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
	   sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
	      --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
apt-get update
apt-get install -y mongodb-org
mkdir /data
mkdir /data/db

apt install openjdk-17-jre
TMP_MAVEN_VERSION=3.9.1
wget https://apache.org/dist/maven/maven-3/$TMP_MAVEN_VERSION/binaries/apache-maven-$TMP_MAVEN_VERSION-bin.tar.gz -P /tmp
tar xf /tmp/apache-maven-*.tar.gz -C /opt
rm /tmp/apache-maven-*-bin.tar.gz
touch /etc/profile.d/maven.sh
chmod 777 /etc/profile.d/maven.sh
echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
