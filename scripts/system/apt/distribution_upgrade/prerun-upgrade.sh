#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Backup the original sources.list file
backup_file="/etc/apt/sources.list.bak"
cp /etc/apt/sources.list "$backup_file"
echo "Backup of sources.list created at $backup_file"

# Function to determine the next Ubuntu version
get_next_ubuntu_version() {
    current_version="$1"

    case $current_version in
        trusty) echo "xenial" ;;
        xenial) echo "bionic" ;;
        bionic) echo "focal" ;;
        focal) echo "hirsute" ;;
        hirsute) echo "impish" ;;
        *) echo "Unknown version"; exit 1 ;;
    esac
}

# Function to update sources.list for distribution upgrade
update_sources_list() {
    current_version="$1"
    next_version="$(get_next_ubuntu_version $current_version)"

    sed -i "s/$current_version/$next_version/g" /etc/apt/sources.list
    echo "Sources.list updated for distribution upgrade from $current_version to $next_version."
}

# Check the current Ubuntu version
current_version=$(lsb_release -sc)

case $current_version in
    trusty|xenial|bionic|focal|hirsute)
        update_sources_list "$current_version"
        ;;
    *)
        echo "Unsupported Ubuntu version: $current_version."
        exit 1
        ;;
esac

# Update the package lists
apt update

echo "Sources.list updated successfully. Please run 'apt dist-upgrade' to perform the distribution upgrade."
