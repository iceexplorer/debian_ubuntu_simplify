#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Update package lists
apt update

# Install GIMP and Inkscape
apt install gimp inkscape -y

# Provide information to the user
echo "GIMP and Inkscape have been installed successfully."
