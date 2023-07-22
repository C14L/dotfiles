#!/bin/bash

##############################################################################
# Install application software
##############################################################################

sudo apt update
sudo apt dist-upgrade --yes
sudo apt autoremove --yes

sudo apt install --yes atop
sudo apt install --yes autojump
sudo apt install --yes build-essentials
sudo apt install --yes cheese
sudo apt install --yes encfs
sudo apt install --yes exif
sudo apt install --yes cmake cmake-data
sudo apt install --yes ffmpeg
sudo apt install --yes fzf
sudo apt install --yes gettext
sudo apt install --yes gimp
sudo apt install --yes git tig
sudo apt install --yes hexedit
sudo apt install --yes htop
sudo apt install --yes httpie
sudo apt install --yes imagemagick
sudo apt install --yes idn
sudo apt install --yes jq
sudo apt install --yes keepassxc
sudo apt install --yes leafpad
sudo apt install --yes libsecret-tools
sudo apt install --yes lm-sensors
sudo apt install --yes mc
sudo apt install --yes mtr # combination of traceroute and ping
sudo apt install --yes ncdu # ncurses-based du
sudo apt install --yes net-tools # includes arp, ifconfig, netstat, rarp, nameif, route, etc
sudo apt install --yes vim
sudo apt install --yes openssl
sudo apt install --yes pass
sudo apt install --yes postgresql postgresql-contrib
sudo apt install --yes pv # shell pipe viewer to monitor pipeline between two processes
sudo apt install --yes rsync
sudo apt install --yes screen tmux
#sudo apt install --yes stress # impose load to test a computer system
sudo apt install --yes tldr
sudo apt install --yes traceroute
sudo apt install --yes tree
sudo apt install --yes virtualenvwrapper
sudo apt install --yes w3m
sudo apt install --yes webp
sudo apt install --yes wget
sudo apt install --yes zlib1g-dev # gzip and pkzip deflate compression methods
sudo apt install --yes systemd-container
sudo apt install --yes curl
sudo apt install --yes unrar zip unzip p7zip-full p7zip-rar
sudo apt install --yes smartmontools # use: sudo smartctl --all /dev/sda

