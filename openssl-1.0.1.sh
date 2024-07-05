#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install necessary dependencies
echo "Installing necessary dependencies..."
sudo apt-get install -y build-essential checkinstall zlib1g-dev

# Download OpenSSL 1.0.1
echo "Downloading OpenSSL 1.0.1..."
wget https://www.openssl.org/source/old/1.0.1/openssl-1.0.1.tar.gz

# Extract the downloaded file
echo "Extracting OpenSSL 1.0.1..."
tar -xvzf openssl-1.0.1.tar.gz

# Navigate to the extracted directory
cd openssl-1.0.1

# Configure the installation
echo "Configuring the installation..."
./config

# Compile the source
echo "Compiling the source..."
make

# Install OpenSSL
echo "Installing OpenSSL..."
sudo make install

# Verify the installation
echo "Verifying the installation..."
openssl version

echo "OpenSSL 1.0.1 installation complete."
