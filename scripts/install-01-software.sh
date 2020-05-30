#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THIRDPARTY="$SCRIPT_DIR/../thirdparty"

echo "Install base packages that should go on all boxes"
read -p "-- Press RETURN to start ---"


##############################################################################
# Update and install default software
##############################################################################

sudo apt update
sudo apt dist-upgrade --yes
sudo apt install --yes \
    apache2-utils \
    atop \
    arandr \
    autojump \
    build-essential \
    cheese \
    chromium-browser \
    clipit \
    cmake \
    cmake-data \
    colortest \
    cryptsetup \
    curl \
    dmenu \
    encfs \
    exif \
    feh \
    ffmpeg \
    font-manager \
    fonts-noto \
    gconf2 \
    gconf2-common \
    gconf-service \
    gconf-service-backend \
    gettext \
    gimp \
    git \
    gnome-shell-extension-system-monitor \
    gnome-shell-extension-taskbar \
    gnome-tweak-tool \
    gpick \
    hexedit \
    htop \
    httpie \
    i3-wm \
    i3blocks \
    i3lock \
    i3status \
    idn \
    jq \
    keepassx \
    leafpad \
    libappindicator1 \
    libc6-dev \
    libgconf-2-4 \
    libffi-dev \
    libfreetype6-dev \
    libgdbm-dev \
    libjpeg-dev \
    libjsoncpp1 \
    libncursesw5-dev \
    libpq-dev \
    librhash0 \
    libsecret-tools \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    lm-sensors \
    linux-tools-common \
    linux-tools-generic \
    mc \
    mtr \
    ncdu \
    net-tools \
    neovim \
    newsbeuter \
    nodejs \
    nomacs \
    npm \
    openssl \
    pass \
    pandoc \
    pavucontrol \
    postgresql \
    postgresql-contrib \
    pv \
    python-apt \
    python-dev \
    python-pip \
    python-setuptools \
    python-smbus \
    python3 \
    python3-dev \
    python3-line-profiler \
    python3-neovim \
    python3-pip \
    python3-setuptools \
    rclone \
    redis \
    redshift \
    screen \
    screenruler \
    scrot \
    shellcheck \
    sshfs \
    stress \
    texlive-fonts-recommended \
    texlive-latex-base \
    texlive-latex-recommended \
    tig \
    tmux \
    traceroute \
    tree \
    vim \
    vim-editorconfig \
    vim-fugitive \
    vim-python-jedi \
    vim-youcompleteme \
    virtualenvwrapper \
    w3m \
    webp \
    wget \
    whois \
    xautolock \
    xbacklight \
    xclip \
    xdotool \
    xsel \
    zlib1g-dev \

##############################################################################
# Install self-compiled packages
##############################################################################

sudo dpkg -i "$THIRDPARTY/alacritty_0.2.9_amd64.deb"
sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

sudo cp "$THIRDPARTY/xkblayout-state" /usr/local/bin/xkblayout-state \
    && sudo chmod 755 /usr/local/bin/xkblayout-state

##############################################################################
# Make some basic directories and files
##############################################################################

mkdir -p ~/bin
mkdir -p ~/.fonts

