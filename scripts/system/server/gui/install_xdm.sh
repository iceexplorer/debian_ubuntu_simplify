#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Update package lists
apt update

# Install XDM
apt install xdm -y

# Set XDM as the default display manager
dpkg-reconfigure xdm

# Provide information to the user
echo "XDM has been installed and set as the default display manager."
