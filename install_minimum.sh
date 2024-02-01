#!/bin/bash


# Update package lists
apt update

# Install common dependencies
apt install -y build-essential

# Install necessary tools
apt install -y wget git python3 python3-dev

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

# Clone and update the repository once a week
REPO_DIR="./debian_ubuntu_simplify"

if [ ! -d "$REPO_DIR" ]; then
    git clone https://github.com/iceexplorer/debian_ubuntu_simplify "$REPO_DIR"
fi

# Add a weekly cron job to update the repository
echo "0 0 * * 0 cd $REPO_DIR && git pull origin master" | crontab -

# Provide information to the user
echo "Essential tools, dependencies, SSH server, SSL Engine, UFW, and fail2ban have been installed and configured."
echo "UFW has been configured to allow traffic on ports 22, 80, and 443."
echo "The repository https://github.com/iceexplorer/debian_ubuntu_simplify has been cloned into $REPO_DIR and will be updated once a week."
