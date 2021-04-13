#!/bin/bash

ECHO INFRASTRUCTURE PACKAGE / NETWORKS

	apt-get update -y
	apt-get install -y apt-utils
	apt-get install dnsutils -y
	apt-get install tcpdump -y
	apt-get install telnet -y
	apt-get install zip -y
	apt-get install wget -y
	apt-get install curl -y
	apt-get install vim -y
	apt-get install libaio1 libaio-dev -y


ECHO INFRASTRUCTURE PACKAGE / SQLPLUS
	
	mkdir -p /opt/oracle
	cd /opt/oracle
	wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basic-linux.x64-21.1.0.0.0.zip
	wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-sqlplus-linux.x64-21.1.0.0.0.zip
	unzip -o instantclient-basic-linux.x64-21.1.0.0.0.zip
	unzip -o instantclient-sqlplus-linux.x64-21.1.0.0.0.zip
	export LD_LIBRARY_PATH=/opt/oracle/instantclient_21_1/
	ORACLE_HOME=/opt/oracle/instantclient_21_1/
	PATH=$ORACLE_HOME/bin:$PATH
	LD_LIBRARY_PATH=$ORACLE_HOME/lib
	export ORACLE_HOME
	export LD_LIBRARY_PATH
	export PATH
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib:$ORACLE_HOME

ECHO FINISHED INSTALLATIONS...
