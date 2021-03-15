#!/bin/bash

##############################################################################
# Install system software
##############################################################################

sudo apt update
sudo apt dist-upgrade --yes
sudo apt autoremove --yes

sudo apt install --yes laptop-mode-tools

sudo apt install --yes acpi acpid # ACPI power management daemon

sudo apt install --yes wireless-tools

sudo apt install --yes fonts-hack # Hack font

sudo apt install --yes light # display brightness control via shell

sudo apt install --yes smartmontools # use: sudo smartctl --all /dev/sda

sudo apt install --yes gir1.2-appindicator3-0.1  # Gnome-shell taskbar icons

