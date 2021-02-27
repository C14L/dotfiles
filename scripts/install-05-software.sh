#!/bin/bash

##############################################################################
# Install application software
##############################################################################

sudo apt update
sudo apt dist-upgrade --yes
sudo apt autoremove --yes

sudo apt install --yes atop
sudo apt install --yes arandr
sudo apt install --yes autojump
sudo apt install --yes build-essentials
sudo apt install --yes cheese
sudo apt install --yes diodon # official succesor of "clipit"
sudo apt install --yes colortest
sudo apt install --yes dmenu
sudo apt install --yes encfs
sudo apt install --yes exif
sudo apt install --yes feh
sudo apt install --yes cmake cmake-data
sudo apt install --yes ffmpeg
sudo apt install --yes font-manager
sudo apt install --yes fonts-noto
sudo apt install --yes gconf2 gconf2-common gconf2-service gconf2-service-backend
sudo apt install --yes gettext
sudo apt install --yes gimp
sudo apt install --yes git tig
sudo apt install --yes gnome-shell-extensions gnome-shell-extension-system-monitor gnome-shell-extension-workspaces-to-dock
sudo apt install --yes gnome-tweak-tool
sudo apt install --yes hexedit
sudo apt install --yes htop
sudo apt install --yes httpie
sudo apt install --yes idn
sudo apt install --yes jq
sudo apt install --yes keepassxc
sudo apt install --yes leafpad
sudo apt install --yes libappindicator1 libc6-dev libgconf-2-4 libffi-dev libfreetype6-dev libgdbm-dev libjpeg-dev libjsoncpp1 libncursesw5-dev libpq-dev librhash0 libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev
sudo apt install --yes libsecret-tools
sudo apt install --yes lm-sensors
sudo apt install --yes linux-tools-common linux-tools-generic
sudo apt install --yes mc
sudo apt install --yes mtr # combination of traceroute and ping
sudo apt install --yes ncdu # ncurses-based du
sudo apt install --yes net-tools # includes arp, ifconfig, netstat, rarp, nameif, route, etc
sudo apt install --yes neovim
# sudo apt install --yes newsboat podboat # rss reader and podcast support
sudo apt install --yes nodejs npm
sudo apt install --yes openssl
sudo apt install --yes pass
sudo apt install --yes pandoc # general markup converter
sudo apt install --yes pavucontrol # sound controls
sudo apt install --yes postgresql postgresql-contrib
sudo apt install --yes pv # shell pipe viewer to monitor pipeline between two processes
sudo apt install --yes python3-apt python3-dev python3-pip python-setuptools
sudo apt install --yes python3-smbus
sudo apt install --yes python3-line-profiler
sudo apt install --yes rclone # like rsync but for cloud storage
sudo apt install --yes redis
sudo apt install --yes screen tmux
sudo apt install --yes screenruler
sudo apt install --yes scrot # simple screenshot tool
sudo apt install --yes sshfs
sudo apt install --yes stress # impose load to test a computer system
sudo apt install --yes texlive-fonts-recommended texlive-latex-base texlive-latex-recommended
sudo apt install --yes traceroute
sudo apt install --yes tree
sudo apt install --yes vim vim-editorconfig vim-fugitive vim-python-jedi vim-youcompleteme
sudo apt install --yes virtualenvwrapper
sudo apt install --yes w3m
sudo apt install --yes webp
sudo apt install --yes wget
sudo apt install --yes whois
# sudo apt install --yes xautolock # lauch program such as X11-xlock after some time of no activity
# sudo apt install --yes xbacklight # set the backlight level via X11 randr
# sudo apt install --yes xclip # X11 clipboard writer
sudo apt install --yes xdotool # simulate X11 keyboard input
sudo apt install --yes xsel # X11 clipboard reader
sudo apt install --yes zlib1g-dev # gzip and pkzip deflate compression methods

sudo apt install --yes systemd-container
sudo apt install --yes ubuntu-restricted-extras
sudo apt install --yes curl

sudo apt install --yes unrar zip unzip p7zip-full p7zip-rar

