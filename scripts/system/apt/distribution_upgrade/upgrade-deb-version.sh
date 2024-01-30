#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or using sudo."
  exit 1
fi

# Update package information
apt update

# Upgrade the system
apt upgrade -y

# Perform distribution upgrade (if needed)
apt dist-upgrade -y

# Remove unnecessary packages
apt autoremove -y

# Clean up package cache
apt clean

echo "System upgrade completed."
