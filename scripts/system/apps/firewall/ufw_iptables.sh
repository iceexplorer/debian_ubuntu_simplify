#!/bin/bash

# Function to print a warning message in red
print_warning() {
    echo -e "\e[1;31mWARNING: $1\e[0m"
}

# Check if the user has sudo rights
if [ $(id -u) -eq 0 ]; then
    echo "You are currently running as root."
    RUN_WITH_SUDO=false
else
    echo "You are not currently running as root."
    read -p "Do you want to run the script with sudo? (Y/N, default: N): " use_sudo

    # Convert input to lowercase to handle both Y and y as yes
    use_sudo_lowercase=$(echo "$use_sudo" | tr '[:upper:]' '[:lower:]')

    if [ "$use_sudo_lowercase" == "y" ]; then
        RUN_WITH_SUDO=true
    else
        echo "It's recommended to run the script as root using 'su -'."
        read -p "Do you want to switch to root and continue? (Y/N): " switch_to_root

        if [ "$switch_to_root" == "Y" ] || [ "$switch_to_root" == "y" ]; then
            echo "Switching to root..."
            sudo su -
            RUN_WITH_SUDO=false
        else
            echo "Exiting without making changes."
            exit 0
        fi
    fi
fi

# Install UFW
if [ "$RUN_WITH_SUDO" == true ]; then
    sudo apt update
    sudo apt install ufw -y
else
    apt update
    apt install ufw -y
fi

# Ask the user if they want to open port 22 (SSH)
read -p "Do you want to open port 22 (SSH)? (Y/N): " open_ssh_port

# Convert input to lowercase to handle both Y and y as yes
open_ssh_port_lowercase=$(echo "$open_ssh_port" | tr '[:upper:]' '[:lower:]')

if [ "$open_ssh_port_lowercase" == "y" ]; then
    # Open port 22 for SSH
    if [ "$RUN_WITH_SUDO" == true ]; then
        sudo ufw allow 22
    else
        ufw allow 22
    fi
else
    # Print a warning about potential SSH connection loss
    print_warning "Answering 'N' to opening port 22 may cause you to lose SSH connection."
fi

# Ensure UFW is activated on startup
if [ "$RUN_WITH_SUDO" == true ]; then
    sudo ufw enable
else
    ufw enable
fi

# Ask the user if they want to activate UFW
read -p "Do you want to activate UFW now? (Y/N): " activate_ufw

# Convert input to lowercase to handle both Y and y as yes
activate_ufw_lowercase=$(echo "$activate_ufw" | tr '[:upper:]' '[:lower:]')

if [ "$activate_ufw_lowercase" == "y" ]; then
    if [ "$RUN_WITH_SUDO" == true ]; then
        sudo ufw --force enable
    else
        ufw --force enable
    fi
    echo "UFW has been activated."
else
    echo "Changes will take effect at the next reboot."
fi

exit 0
