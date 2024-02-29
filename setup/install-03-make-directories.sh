#!/bin/bash

##############################################################################
# Make some basic directories and files
##############################################################################

mkdir -p ~/bin
mkdir -p ~/Private

sudo touch /islocal.txt
sudo mkdir -p /WD1TB
sudo mkdir -p /WD2TB
sudo mkdir -p /WD4TB
sudo mkdir -p /SD128GB_1
sudo mkdir -p /SD128GB_2

sudo mkdir -p /space && sudo chown $USER:$USER /space

