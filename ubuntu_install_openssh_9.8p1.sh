#!/bin/bash

# Atualiza a lista de pacotes disponíveis e suas versões
sudo apt update -y

# Atualiza todos os pacotes instalados para as versões mais recentes
sudo apt upgrade -y

# Instala os pacotes necessários para compilar programas a partir do código-fonte
sudo apt install build-essential zlib1g-dev libssl-dev -y

# Baixa o código-fonte do OpenSSH 9.8p1
wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.8p1.tar.gz

# Descompacta o arquivo baixado e navega para o diretório descompactado
tar -xzf openssh-9.8p1.tar.gz
cd openssh-9.8p1

# Configura o ambiente de compilação
./configure --prefix=/usr --sysconfdir=/etc/ssh --with-md5-passwords

# Compila o código-fonte
make

# Instala o OpenSSH
sudo make install

# Verifica se os binários foram instalados corretamente
if [ ! -f /usr/sbin/sshd ] || [ ! -f /usr/bin/ssh ]; then
    SSHD_PATH=$(find /usr/local -name sshd)
    SSH_PATH=$(find /usr/local -name ssh)
    if [ -n "$SSHD_PATH" ] && [ -n "$SSH_PATH" ]; then
        sudo mv $SSHD_PATH /usr/sbin/sshd
        sudo mv $SSH_PATH /usr/bin/ssh
    else
        echo "Os binários não foram encontrados. Verifique o processo de compilação."
        exit 1
    fi
fi

# Reinicia o serviço SSH
sudo systemctl restart sshd

# Verifica a versão instalada do OpenSSH
ssh -V
