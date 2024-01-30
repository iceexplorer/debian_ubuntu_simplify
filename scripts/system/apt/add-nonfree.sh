#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Function to add non-free repositories based on Debian version
add_nonfree_repos() {
    distribution="$1"
    version="$2"

    echo "
    # Non-free repositories
    deb http://deb.debian.org/debian/ $version main contrib non-free
    deb-src http://deb.debian.org/debian/ $version main contrib non-free

    deb http://deb.debian.org/debian/ $version-updates main contrib non-free
    deb-src http://deb.debian.org/debian/ $version-updates main contrib non-free

    deb http://security.debian.org/debian-security/ $version/updates main contrib non-free
    deb-src http://security.debian.org/debian-security/ $version/updates main contrib non-free
    " >> /etc/apt/sources.list

    echo "Non-free repositories added successfully for $distribution $version."
}

# Check the distribution and version
distribution=$(lsb_release -si)
version=$(lsb_release -sc)

case $distribution in
    Debian)
        add_nonfree_repos "$distribution" "$version"
        ;;
    Ubuntu)
        if [ "$version" == "focal" ] || [ "$version" == "hirsute" ]; then
            add_nonfree_repos "$distribution" "$version"
        else
            echo "Non-free repositories are not supported for this Ubuntu version."
            exit 1
        fi
        ;;
    *)
        echo "Unsupported distribution: $distribution."
        exit 1
        ;;
esac

# Update the package lists
apt update

echo "Repositories updated successfully."
