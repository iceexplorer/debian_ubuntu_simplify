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

# Install UFW (Uncomplicated Firewall)
apt install -y ufw

# Allow SSH, HTTP, and HTTPS through UFW
ufw allow 22
ufw allow 80
ufw allow 443

# Enable UFW
ufw --force enable

# Install fail2ban
apt install -y fail2ban

# Provide information to the user
echo "Essential tools, dependencies, SSH server, SSL Engine, UFW, and fail2ban have been installed and configured."
echo "UFW has been configured to allow traffic on ports 22, 80, and 443."
