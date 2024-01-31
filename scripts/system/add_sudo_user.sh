#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Prompt the user to switch to root if not already root
echo "You are currently logged in as $(whoami)."
read -p "Do you want to switch to root? (y/n): " switch_root

if [ "$switch_root" == "y" ]; then
    su
fi

# Ask for the username to add to sudo
read -p "Enter the username to add to the sudo group: " username

# Check if the username is valid
if [ -z "$username" ]; then
    echo "Username cannot be empty. Exiting."
    exit 1
fi

# Check if the user exists
if id "$username" &>/dev/null; then
    # Add the user to the sudo group
    usermod -aG sudo "$username"
    echo "User $username added to the sudo group successfully."
else
    echo "User $username does not exist. Exiting."
    exit 1
fi
