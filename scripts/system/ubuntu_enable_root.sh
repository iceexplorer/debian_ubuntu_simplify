#!/bin/bash

# Prompt the user for their password
echo -n "Enter your user password (sudo password): "
read -s user_password
echo

# Check if the user has sudo privileges
if ! echo "$user_password" | sudo -S true; then
    echo "User does not have sudo privileges. Exiting."
    exit 1
fi

# Prompt the user to enter a new password for the root user
read -s -p "Enter the new password for the root user: " new_password
echo

# Check if the password is empty
if [ -z "$new_password" ]; then
    echo "Password cannot be empty. Exiting."
    exit 1
fi

# Change the root password using sudo
echo "root:$new_password" | sudo -S chpasswd

echo "Root password changed successfully."
