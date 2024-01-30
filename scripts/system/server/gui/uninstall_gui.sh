#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Display warning message
echo -e "\e[1;31mWARNING: THIS SCRIPT WILL REMOVE ALL GRAPHICAL FEATURES FROM THE SYSTEM.\e[0m"
echo -e "\e[1;31mAFTER REBOOT, ONLY THE COMMAND LINE WILL BE AVAILABLE.\e[0m"
echo -e "\e[1;31mPLEASE ENSURE YOU HAVE BACKED UP IMPORTANT DATA BEFORE PROCEEDING.\e[0m"

# List of common GUI-related packages
gui_packages=(
    '^xserver.*'
    '^ubuntu-desktop'
    '^kubuntu-desktop'
    '^kde.*'
    '^gnome.*'
    '^cinnamon.*'
    '^mate.*'
    '^xfce.*'
    '^lxde.*'
    '^lxqt.*'
)

# Remove GUI packages
apt-get purge "${gui_packages[@]}" -y
apt-get autoremove -y
apt-get clean

# Provide information to the user
echo "GUI packages have been uninstalled. Please reboot the system for changes to take effect."
