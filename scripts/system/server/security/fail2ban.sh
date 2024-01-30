#!/bin/bash

# Sjekk om skriptet kjøres med rotrettigheter
if [ "$EUID" -ne 0 ]; then
    echo "Vennligst kjør som rot eller bruk sudo."
    exit 1
fi

# Oppdater pakkelistene
apt update

# Installer fail2ban
apt install fail2ban -y

# Kopier fail2ban-konfigurasjonsfilen før endringer
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Konfigurer fail2ban for å forhindre rotinnlogging
echo -e "\n[sshd]\nenabled = true\nport = ssh\nfilter = sshd\nlogpath = /var/log/auth.log\nmaxretry = 3\nbantime = 3600\n" >> /etc/fail2ban/jail.local

# Legg til banner for forsøk på rotinnlogging
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config

# Restart ssh-tjenesten
systemctl restart ssh

# Start fail2ban-tjenesten
systemctl start fail2ban

# Aktiver fail2ban for automatisk oppstart
systemctl enable fail2ban

# Gi informasjon til brukeren
echo "fail2ban er installert og konfigurert for å forhindre rotinnlogging. Banner er lagt til for forsøk på rotinnlogging."
