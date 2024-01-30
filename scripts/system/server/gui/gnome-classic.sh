#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Update package lists
apt update

# Install GNOME Classic desktop environment
apt install gnome-session-flashback -y

# Provide information to the user
echo "GNOME Classic has been installed. You can choose 'GNOME Flashback (Metacity)'"
echo "session from the login screen to use the GNOME Classic desktop environment."
