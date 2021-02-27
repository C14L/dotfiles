#!/bin/bash

##############################################################################
# Install system software
##############################################################################

sudo apt update
sudo apt dist-upgrade --yes
sudo apt autoremove --yes

sudo apt install --yes laptop-mode-tools

sudo apt install --yes acpid # ACPI power management daemon

sudo apt install --yes wireless-tools

sudo apt install --yes fonts-hack # Hack font


