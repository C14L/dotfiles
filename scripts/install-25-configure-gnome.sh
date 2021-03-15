#!/bin/bash

##############################################################################
# Change Gnome default key mappings
##############################################################################

# Disable Ctrl+Shift+Arrow Keys to switch desktop down/up:

# $ gsettings get org.gnome.desktop.wm.keybindings switch-to-workspace-down
#['<Super>Page_Down', '<Control><Alt>Down']

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down']"

# $ gsettings get org.gnome.desktop.wm.keybindings switch-to-workspace-up
#['<Super>Page_Up', '<Control><Alt>Up']

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up']"


# $ gsettings get org.gnome.desktop.wm.keybindings move-to-workspace-down
#['<Super><Shift>Page_Down', '<Control><Shift><Alt>Down']

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift>Page_Down']"

# $ gsettings get org.gnome.desktop.wm.keybindings move-to-workspace-up
#['<Super><Shift>Page_Up', '<Control><Shift><Alt>Up']

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift>Page_Up']"

