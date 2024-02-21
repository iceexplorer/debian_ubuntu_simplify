#!/bin/bash

# This script should fix the problems to start Fail2Ban on Debian 12. DO NOT use this script on other Debian systems! From Debian 12, maintainers have changed where the needed logs are. Therefore Fail2an fails

# This command installs the 'python3-systemd' package, which someone commented that is required for systemd backend support in Fail2Ban. I always have this installed, so I can`t verify if it is true or not, so I just added it. No big deal

sudo apt-get update
sudo apt-get install -y python3-systemd

# Enable Fail2Ban for SSH
# [sshd] section is created in the jail.local file with 'enabled=true'
echo -e "[sshd]\nenabled=true" | sudo tee /etc/fail2ban/jail.local

# Modify Fail2Ban settings for SSH
# [sshd] section is updated in the jail.local file with 'backend=systemd' and 'enabled=true'
echo -e "[sshd]\nbackend=systemd\nenabled=true" | sudo tee -a /etc/fail2ban/jail.local
