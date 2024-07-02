#!/bin/bash

# Script para atualizar o OpenSSH para a versão 9.8p1 em CentOS

# Atualiza todos os pacotes instalados
sudo yum update -y

# Instala as dependências necessárias para compilar o OpenSSH
sudo yum install -y gcc make wget zlib-devel openssl-devel

# Baixa o código-fonte do OpenSSH 9.8p1
wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.8p1.tar.gz

# Descompacta o arquivo baixado
tar -xzf openssh-9.8p1.tar.gz

# Navega para o diretório do código-fonte do OpenSSH
cd openssh-9.8p1

# Configura o ambiente de compilação
./configure --prefix=/usr --sysconfdir=/etc/ssh --with-md5-passwords

# Compila o código-fonte
make

# Instala o OpenSSH
sudo make install

# Reinicia o serviço SSH para aplicar as mudanças
sudo systemctl restart sshd

# Verifica a versão instalada do OpenSSH
ssh -V
