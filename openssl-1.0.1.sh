#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install necessary dependencies
echo "Installing necessary dependencies..."
sudo apt-get install -y build-essential checkinstall zlib1g-dev wget

# Download OpenSSL 1.0.1
echo "Downloading OpenSSL 1.0.1..."
wget https://www.openssl.org/source/old/1.0.1/openssl-1.0.1u.tar.gz

# Extract the downloaded file
echo "Extracting OpenSSL 1.0.1..."
tar -xvzf openssl-1.0.1u.tar.gz

# Navigate to the extracted directory
cd openssl-1.0.1u

# Configure the installation
echo "Configuring the installation..."
./config

# Compile the source
echo "Compiling the source..."
make

# Install OpenSSL
echo "Installing OpenSSL..."
sudo make install

# Create symbolic links for libssl and libcrypto
echo "Creating symbolic links for libssl and libcrypto..."
sudo ln -sf /usr/local/ssl/lib/libssl.so.1.0.1 /usr/lib/libssl.so.1.0.1
sudo ln -sf /usr/local/ssl/lib/libcrypto.so.1.0.1 /usr/lib/libcrypto.so.1.0.1

# Add OpenSSL 1.0.1 to the PATH
echo 'export PATH="/usr/local/ssl/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Verify the installation
echo "Verifying the installation..."
openssl version

echo "OpenSSL 1.0.1 installation complete."
