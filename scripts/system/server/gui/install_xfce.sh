#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Update package lists
apt update

# Install XFCE desktop environment
apt install xfce4 -y

# Provide information to the user
echo "XFCE has been installed. You can choose 'XFCE Session' from the login screen"
echo "to use the XFCE desktop environment."
