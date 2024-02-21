#!/bin/bash

# Update package list
apt update

# Install fail2ban
apt install fail2ban -y

# Copy fail2ban-config before doing any changes
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Ci\onfigure fail2ban to prevent root login
echo -e "\n[sshd]\nenabled = true\nport = ssh\nfilter = sshd\nlogpath = /var/log/auth.log\nmaxretry = 3\nbantime = 3600\n" >> /etc/fail2ban/jail.local

# Add banner for attempted root login
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config

# Restart the ssh-service
systemctl restart ssh

# Start the fail2ban-service
systemctl start fail2ban

# Activate fail2ban so that it starts automatically
systemctl enable fail2ban

# Inform the user about what has happened
echo "fail2ban is installed and configured to default settings. Furthermore, root login is disabled. If you use Debian 12, you will need to run the script fix_debian12-fail2ban-sshd.sh also"
