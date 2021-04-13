#!/bin/bash

apt-get update -y
apt-get install -y apt-utils
apt-get install dnsutils -y
apt-get install telnet -y
apt-get install zip -y
apt-get install wget -y
apt-get install curl -y
apt-get install vim -y
apt-get install libaio1 libaio-dev -y
apt-get install alien -y
mkdir -p /opt/oracle
cd /opt/oracle
wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basic-linux.x64-21.1.0.0.0.zip
wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-sqlplus-linux.x64-21.1.0.0.0.zip
unzip instantclient-basic-linux.x64-21.1.0.0.0.zip
unzip instantclient-sqlplus-linux.x64-21.1.0.0.0.zip
export LD_LIBRARY_PATH=/opt/oracle/instantclient_21_1/
alias sqlplus="cd /opt/oracle/instantclient_21_1/ && ./sqlplus"
echo 'alias sqlplus="cd /opt/oracle/instantclient_21_1/ && ./sqlplus" ' >> ~/.bashrc