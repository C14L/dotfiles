#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

THIRDPARTY="$SCRIPT_DIR/../thirdparty"

##############################################################################
# Install deb packages and self-compiled packages
##############################################################################

# Self-compiled Rust code: tealdeer
# sudo cp "$THIRDPARTY/tldr" /usr/local/bin/tldr && sudo chmod 755 /usr/local/bin/tldr

# Downloaded from Debian? prossibly:
#sudo dpkg -i "$THIRDPARTY/alacritty_0.2.9_amd64.deb"
#sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

# Self-compiled C code:
#sudo cp "$THIRDPARTY/xkblayout-state" /usr/local/bin/xkblayout-state \
#    && sudo chmod 755 /usr/local/bin/xkblayout-state

