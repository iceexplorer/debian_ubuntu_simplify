# Simplify your life as a Debian or Ubuntu user
In this repo, you will find scripts to make your Linux experience more easy. Based on all the mistakes I have made, and continue to make, after 20 years of working with Debian and Ubuntu in "real life" (So... no, it is not just you ;)

Most of my machines are servers, many of them with GUI (Graphical User Interface) and a lot of them with only CLI (Command Line Interface). Since I am "deep" into machine learning (ML) there will soon to be guides and scripts to implement NVIDIA GPUs into your cluster. Right now "nothing" seems to work ;)

The scripts are mainly tested on Debian, but also on Ubuntu. It may also happen that the scripts will work well on other Debian-based systems (such as Ubuntu). Please give feedback on what distros these scripts might be useful on (I only do Debian and some Ubuntu`s for fun).

If you choose to run the the script https://github.com/iceexplorer/debian_ubuntu_simplify/blob/main/install_minimum.sh this will install some needed security features such as ufw (Uncomplicated Firewall) which controls IPtables, which perhaps is the world's best FireWall, configures it to not block you out of your server (SSH). In addition, the script installs the ssh server and everything needed to make, handle, and install certificates. In addition, it protects your system by installing an application called fail2ban that protects your system from direct attacks, as DDoS attacks. If you do not know what you are doing (e.g. a previous Windows user ;) Just run it!

# How to run the scripts right now?
Sometime in the near future, there will be a user-friendly script to use the scripts released here. Right now, these scripts are NOT user-friendly 🤭 even though this whole project is about being user-friendly 🤪 I just need a bit more time to make them user-friendly. Until I find the time, this is how you can run the scripts:

**ALL scripts NEED to be run as super-root. To be super-root use the command "su -" in the command line **

Example to become "super root"
su -
(enter root password, NOT your user password, but the password to the root account. If you do not have the root password, run this script as sudo https://github.com/iceexplorer/debian_ubuntu_simplify/blob/main/scripts/system/ubuntu_enable_root.sh )

The scripts have ONLY been verified to run as the super-administrator on Debian. This will mean running the command "su - " (without the " in the front and beginning "). DO NOT try to run the scripts without the "-" marker after the "su" statement. The "-" in Debian means that you are a "super admin". If you skip the "-", you are only a regular root user. The regular one (without the "-" argument) will work in most cases. In the cases it DO NOT work, the scripts might cause serious "fuck ups" in your system since fail-overs are not planned. If in the command line Debian ALWAYS uses the "-" argument when SUing! Else you WILL fuck up in the end (when it truly matters).

1. Download the script in a folder of your choice
2. open a terminal
3. cd to your download folder (like /home/MY_USERNAME/Downloads)
4. chmod +x script_name.sh
5. su -
6. Give your ROOT password (not your own)
7. ./name_of_file.sh
8. If step 7 do not work you might try to do these commands: sh name_of_file.sh, or bash name_of_file.sh
9. If non of them work, I am out of options ;)
10. As of now: DO NOT execute scripts using sudo ./script_name.sh !! You will have to be the root user. The only "safe" sudo script as of now is the script for Ubuntu users to become root ( https://github.com/iceexplorer/debian_ubuntu_simplify/blob/main/scripts/system/ubuntu_enable_root.sh )
   
# Debian and Ubuntu Setup Scripts Repository

Welcome to this Debian and Ubuntu Setup Scripts repository! This repository is dedicated to providing a collection of scripts for simplifying the setup and management of Debian and Ubuntu machines. The scripts shared here are what I always need to do, or correct, after installing a new Debian or Ubuntu system. It might be that I am plain stupid, or just forgetful (I hope for the latter ;) for making the same mistakes over, and over again. The need for these scripts is based on personal experiences and opinions, with the understanding that they may not cover every use case.

These first weeks after opening the repo (starting from the last day of January 2024), it might be that some of the scripts I uploaded were not the ones that worked... I will first upload everything I believe was working, and within February 2024 I will verify every script on my Kubernetes Cluster that I am proudly working on, and will share as a new "set-up-script" project (It is f**** needed since most guides lead to a non-working system if you tend to keep it a bit secure)

After all scripts are verified to work as expected, I will make some scripts in the main folder to make this easy. As of now, the scripts are fragmented and sorted by function. The plan is to make a good "overall" .sh file that is user-friendly and is located at the root of this project.

ALL help is welcome! 

I am a really bad coder, but usually it works! At least I know my limitations, I embrace them and acknowledge that my strengths lie elsewhere ;)

## Purpose

The main goal of this repository is to offer scripts that enhance the user experience when working with Debian and Ubuntu systems. These scripts are designed to automate various setup tasks, making it easier for users to configure their machines according to their preferences.

## Examples of Useful Scripts

### Add Commercial APT Sources
- Incorporate commercial APT sources into Debian or Ubuntu with the provided script.

### Enable Root User on Ubuntu
- Facilitate the process of working with the root user on Ubuntu using this script.

### Install Many Useful Programs
- Automate the installation of commonly used programs, enhancing system functionality.

### Adjust Settings on Newly Installed Debian Systems
- Customize and configure settings on recently setup Debian systems with these scripts.

## Disclaimer

These scripts are provided as-is and may not suit all use cases. Users are encouraged to review and customize the scripts based on their specific requirements. Utilize them at your own discretion.

## Contributions

Contributions to this repository are welcome! Whether suggesting improvements, reporting issues, or sharing additional useful scripts, your input is valuable. Feel free to submit pull requests or open issues.

## License

This project is licensed under the [Apache License 2.0](LICENSE).

# Apache License 2.0 Overview

The scripts in this repository are licensed under the [Apache License 2.0](LICENSE), a permissive open-source license that provides users with extensive freedoms for using, modifying, distributing, and sublicensing the scripts.

## Key Points

1. **Permission:**
   - You are granted broad permissions to freely use, modify, and distribute the scripts.

2. **Private and Commercial Use:**
   - The Apache License 2.0 explicitly allows the use of these scripts for both private and commercial purposes. Whether you're setting up a personal machine or configuring systems for a business, you're covered.

3. **Modifications and Derivatives:**
   - Feel free to modify the scripts and create derivative works, adapting them to your specific needs.

4. **Distribution:**
   - You can distribute the scripts, in their original or modified form, as long as you comply with the terms of the license.

5. **No Trademark Use:**
   - The license does not grant permission to use any trademarks, service marks, or trade names associated with the scripts.

6. **No Warranty:**
   - The scripts are provided "as is" without warranties or conditions of any kind, either expressed or implied.

## Use Cases

- **Private Use:**
  - Freely use the scripts for personal projects, customizing them according to your preferences.

- **Commercial Use:**
  - Businesses can leverage these scripts for various purposes, including setup and configuration of Debian and Ubuntu systems.

- **Distribution:**
  - Distribute the scripts within your organization or share them with the community.

## Contributions

Contributions to the repository are welcome under the terms of the Apache License 2.0. Enhancements or additional features you provide can benefit both individuals and businesses.

By using these scripts, you embrace the flexibility and freedom offered by the Apache License 2.0, enabling a wide range of uses and contributions.

