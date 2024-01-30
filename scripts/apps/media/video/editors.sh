#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Update package lists to use the latest repositories
apt update

# Install Kdenlive and OpenShot
apt install kdenlive openshot -y

# Provide information to the user
echo "Kdenlive and OpenShot have been installed successfully."
