#!/bin/bash

# Check if the user has sudo privileges
if [ $(id -u) -ne 0 ]; then
    echo "This script requires sudo privileges. Do you want to use sudo for commands? (Y/N): "
    read use_sudo

    # Convert input to lowercase to handle both Y and y as yes
    use_sudo_lowercase=$(echo "$use_sudo" | tr '[:upper:]' '[:lower:]')

    if [ "$use_sudo_lowercase" = "y" ]; then
        sudo_available="true"
    else
        echo "You chose not to use sudo. The script will attempt to switch to the root user using 'su -'."
    fi
else
    sudo_available="true"
fi

# Ask the user if they want to install Google Chrome
read -p "Do you want to install Google Chrome? (Y/N): " install_choice

# Convert input to lowercase to handle both Y and y as yes
install_choice_lowercase=$(echo "$install_choice" | tr '[:upper:]' '[:lower:]')

# Check if the user chose to install or not
if [ "$install_choice_lowercase" != "y" ]; then
    echo "Installation of Google Chrome aborted."
    exit 0
fi

# Install necessary tools and dependencies with sudo if available
if [ "$sudo_available" = "true" ]; then
    sudo apt install apt-transport-https curl -y
else
    apt install apt-transport-https curl -y
fi

# Download and add the Google Chrome key
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | ($sudo_available && sudo gpg --dearmor || gpg --dearmor) | ($sudo_available && sudo tee /usr/share/keyrings/google-chrome.gpg || tee /usr/share/keyrings/google-chrome.gpg) >> /dev/null

# Add the Google Chrome repository
echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | ($sudo_available && sudo tee /etc/apt/sources.list.d/google-chrome.list || tee /etc/apt/sources.list.d/google-chrome.list)

# Update apt repositories with sudo if available
if [ "$sudo_available" = "true" ]; then
    sudo apt update
else
    apt update
fi

# Install Google Chrome with sudo if available
if [ "$sudo_available" = "true" ]; then
    sudo apt install google-chrome-stable
else
    apt install google-chrome-stable
fi

echo "Google Chrome has been installed."
