#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Backup the sshd_config file
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Disable root login in the sshd_config file
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Reload the SSH service to apply the changes
systemctl reload ssh

# Provide information to the user
echo "Root login has been disabled. Please use a non-root user to log in."
