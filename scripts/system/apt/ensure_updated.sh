#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Update the package lists
apt update

# Upgrade installed packages
apt upgrade -y

# Remove obsolete packages
apt autoremove -y

# Clean up package cache
apt clean

echo "System is now up to date."
