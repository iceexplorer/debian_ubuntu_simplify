#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Update package lists
apt update

# Install common dependencies
apt install -y build-essential

# Install necessary tools
apt install -y wget git python python-dev

# Install SSH server
apt install -y openssh-server

# Install SSL Engine
apt install -y libssl-dev

# Provide information to the user
echo "Essential tools, dependencies, SSH server, and SSL Engine have been installed."
