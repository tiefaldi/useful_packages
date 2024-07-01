#!/bin/bash

# Este script irá instalar o OpenSSH 9.8p1 em um sistema Ubuntu.

# Atualiza a lista de pacotes disponíveis e suas versões
echo "Atualizando a lista de pacotes..."
sudo apt update

# Atualiza todos os pacotes instalados para as versões mais recentes
echo "Atualizando os pacotes instalados..."
sudo apt upgrade -y

# Instala os pacotes necessários para compilar programas a partir do código-fonte
echo "Instalando dependências (build-essential, zlib1g-dev, libssl-dev)..."
sudo apt install build-essential zlib1g-dev libssl-dev -y

# Baixa o código-fonte do OpenSSH 9.8p1
echo "Baixando o código-fonte do OpenSSH 9.8p1..."
wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.8p1.tar.gz

# Descompacta o arquivo baixado
echo "Descompactando o arquivo tar.gz..."
tar -xzf openssh-9.8p1.tar.gz

# Navega para o diretório descompactado que contém o código-fonte do OpenSSH
cd openssh-9.8p1

# Configura o ambiente de compilação
echo "Configurando o ambiente de compilação..."
./configure --prefix=/usr --sysconfdir=/etc/ssh --with-md5-passwords

# Compila o código-fonte, transformando-o em binários executáveis
echo "Compilando o código-fonte..."
make

# Instala os binários compilados e outros arquivos necessários nos diretórios apropriados do sistema
echo "Instalando o OpenSSH..."
sudo make install

# Verifica se os binários foram instalados corretamente
echo "Verificando a instalação dos binários..."
if [ -f /usr/sbin/sshd ] && [ -f /usr/bin/ssh ]; then
    echo "Os binários foram instalados corretamente."
else
    echo "Os binários não foram encontrados nos locais esperados. Procurando em /usr/local..."
    SSHD_PATH=$(find /usr/local -name sshd)
    SSH_PATH=$(find /usr/local -name ssh)
    if [ -n "$SSHD_PATH" ] && [ -n "$SSH_PATH" ]; then
        echo "Movendo os binários para os diretórios corretos..."
        sudo mv $SSHD_PATH /usr/sbin/sshd
        sudo mv $SSH_PATH /usr/bin/ssh
    else
        echo "Os binários não foram encontrados. Verifique o processo de compilação."
        exit 1
    fi
fi

# Reinicia o serviço SSH para aplicar as mudanças feitas com a instalação do novo OpenSSH
echo "Reiniciando o serviço SSH..."
sudo systemctl restart sshd

# Verifica a versão instalada do OpenSSH para garantir que a atualização foi bem-sucedida
echo "Verificando a versão instalada do OpenSSH..."
ssh -V
