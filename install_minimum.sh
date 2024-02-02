#!/bin/bash

# Switch to root user
su -

# Function to backup sources.list before modifying it
backup_sources_list() {
    cp /etc/apt/sources.list /etc/apt/sources.list.bak
}

# Function to update the distribution repository to include non-free repo
update_distro_repo() {
    backup_sources_list
    sed -i 's/main$/main contrib non-free/' /etc/apt/sources.list
    apt update
}

# Install common dependencies
apt install -y build-essential

# Install necessary tools
apt install -y wget git python3 python3-dev nano

# Install SSH server
apt install -y openssh-server

# Install SSL Engine
apt install -y libssl-dev

# Install UFW (Uncomplicated Firewall)
apt install -y ufw

# Allow SSH, HTTP, and HTTPS through UFW
ufw allow 22
ufw allow 80
ufw allow 443

# Enable UFW
ufw enable

# Install fail2ban
apt install -y fail2ban

# Ask for the non-root username
read -p "Enter the non-root username (usually your normal login name): " USERNAME

# Use the provided username to determine the user's home directory
USER_HOME=$(getent passwd "$USERNAME" | cut -d: -f6)

# Ask if the user wants to create a subfolder
read -p "Do you want to create a subfolder in $USER_HOME? (yes/no): " CREATE_SUBFOLDER

# Set the repository directory based on user input
if [ "$CREATE_SUBFOLDER" = "yes" ]; then
    read -p "Enter subfolder name: " SUBFOLDER_NAME
    REPO_DIR="$USER_HOME/$SUBFOLDER_NAME"
else
    REPO_DIR="$USER_HOME"
fi

# Ask if the user wants to keep the folder up to date
read -p "Do you want to keep the folder up to date? (yes/no): " UPDATE_REPO

# Clone or copy the repository based on user input
if [ "$UPDATE_REPO" = "yes" ]; then
    # Clone the repository
    git clone https://github.com/iceexplorer/debian_ubuntu_simplify "$REPO_DIR"
    # Add a weekly cron job to update the repository
    echo "0 0 * * 0 cd $REPO_DIR && git pull origin master" | crontab -
else
    # Copy the repository
    wget https://github.com/iceexplorer/debian_ubuntu_simplify/archive/master.zip -O "$REPO_DIR/master.zip"
    unzip "$REPO_DIR/master.zip" -d "$REPO_DIR"
    rm "$REPO_DIR/master.zip"
fi

# Provide information to the user
echo "Essential tools, dependencies, SSH server, SSL Engine, UFW, and fail2ban have been installed and configured."
echo "UFW has been configured to allow traffic on ports 22, 80, and 443."
echo "The repository has been cloned or copied to $REPO_DIR."
echo "User $USERNAME has been used for the installation."
