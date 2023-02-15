#!/bin/bash

ECHO INFRASTRUCTURE PACKAGE / NETWORKS

	apt-get update -y
	apt-get install apt-utils -y
	apt-get install iputils-ping -y
	apt-get install dnsutils -y
	apt-get install tcpdump -y
	apt-get install telnet -y
	apt-get install zip -y
	apt-get install wget -y
	apt-get install curl -y
	apt-get install vim -y
	apt-get install alien -y
	apt-get install libaio1 -y


echo INFRASTRUCTURE PACKAGE / SQLPLUS

	mkdir -p /tmp/oracle
	cd /tmp/oracle
	wget https://download.oracle.com/otn_software/linux/instantclient/211000/oracle-instantclient-basic-21.1.0.0.0-1.x86_64.rpm
   	wget https://download.oracle.com/otn_software/linux/instantclient/211000/oracle-instantclient-sqlplus-21.1.0.0.0-1.x86_64.rpm
    	wget https://download.oracle.com/otn_software/linux/instantclient/211000/oracle-instantclient-devel-21.1.0.0.0-1.x86_64.rpm
    	alien -i oracle-instantclient-basic-21.1.0.0.0-1.x86_64.rpm
    	alien -i oracle-instantclient-sqlplus-21.1.0.0.0-1.x86_64.rpm
    	alien -i oracle-instantclient-devel-21.1.0.0.0-1.x86_64.rpm
    	echo /usr/lib/oracle/21/client64 >> /etc/ld.so.conf.d/oracle.conf
    	ldconfig
	

echo FINISHED INSTALLATIONS...
