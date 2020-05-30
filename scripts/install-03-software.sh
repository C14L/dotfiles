#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THIRDPARTY="$SCRIPT_DIR/../thirdparty"

echo "Install limited packages only on some boxes"
read -p "-- Press RETURN to start ---"

##############################################################################
# Update and install default software
##############################################################################

sudo apt update
sudo apt dist-upgrade --yes
sudo apt install --yes \
    systemd-container \
    tk-dev \
    ubuntu-restricted-extras \
    vanilla-gnome-default-settings \
    vanilla-gnome-desktop \
    youtube-dl

##############################################################################
# Remove unused default packages
##############################################################################

sudo apt remove --yes \
    thunderbird

##############################################################################
# Install self-compiled packages
##############################################################################

sudo dpkg -i "$THIRDPARTY/fzf_0.17.5-1_amd64.deb"

sudo cp "$THIRDPARTY/tldr" /usr/local/bin/tldr \
    && sudo chmod 755 /usr/local/bin/tldr

##############################################################################
# Make some basic directories and files
##############################################################################

mkdir -p ~/bin
mkdir -p ~/.fonts
mkdir -p ~/Private

sudo touch /islocal.txt
sudo mkdir -p /WD1TB
sudo mkdir -p /WD2TB
sudo mkdir -p /SD128GB_1
sudo mkdir -p /SD128GB_2
sudo mkdir -p /space01

