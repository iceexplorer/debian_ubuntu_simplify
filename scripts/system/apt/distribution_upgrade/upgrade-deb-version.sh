#!/bin/bash

# run as super-root
su -

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
