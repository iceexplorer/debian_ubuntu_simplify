#!/bin/bash

# Function to determine the next Debian or Ubuntu version
get_next_version() {
    current_version="$1"

    case $current_version in
        trusty) echo "xenial" ;;
        xenial) echo "bionic" ;;
        bionic) echo "focal" ;;
        focal) echo "hirsute" ;;
        hirsute) echo "impish" ;;
        jessie) echo "stretch" ;;
        stretch) echo "buster" ;;
        buster) echo "bullseye" ;;
        bullseye) echo "bookworm" ;;
        *) echo "Unknown version"; exit 1 ;;
    esac
}

# Function to update sources.list for distribution upgrade
update_sources_list() {
    current_version="$1"
    next_version="$(get_next_version $current_version)"

    sed -i "s/$current_version/$next_version/g" /etc/apt/sources.list
    echo "Sources.list updated for distribution upgrade from $current_version to $next_version."
}

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Determine distribution and version
if [ -f /etc/debian_version ]; then
    DISTRIBUTION="Debian"
    VERSION=$(cat /etc/debian_version)
elif [ -f /etc/lsb-release ]; then
    DISTRIBUTION=$(grep "DISTRIB_ID" /etc/lsb-release | cut -d= -f2)
    VERSION=$(grep "DISTRIB_RELEASE" /etc/lsb-release | cut -d= -f2)
else
    echo "Unsupported distribution. Exiting."
    exit 1
fi

# Ask the user to confirm
read -p "This system seems to be a $DISTRIBUTION $VERSION system. Confirm (Y/N): " CONFIRM

# Check the user's response
if [ "$CONFIRM" != "Y" ] && [ "$CONFIRM" != "y" ]; then
    echo "Update aborted by user."
    exit 0
fi

# Backup the original sources.list file
backup_file="/etc/apt/sources.list.bak"
cp /etc/apt/sources.list "$backup_file"
echo "Backup of sources.list created at $backup_file"

# Check the current version and update sources.list for distribution upgrade
case $VERSION in
    trusty|xenial|bionic|focal|hirsute|jessie|stretch|buster|bullseye)
        update_sources_list "$VERSION"
        ;;
    *)
        echo "Unsupported version: $VERSION."
        exit 1
        ;;
esac

# Update the package lists
apt update

echo "Sources.list updated successfully. Please run 'apt dist-upgrade' to perform the distribution upgrade."
