#!/usr/bin/env bash

######################################################################
# Change Gnome default key mappings
######################################################################
#
# List all bindings:
#
# gsettings list-recursively  org.gnome.desktop.wm.keybindings | sort
#
######################################################################

# disable window grouping and enable window switching

gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Super>Tab']"

# Disable Ctrl+Shift+Arrow Keys to switch desktop down/up, use <Super> instead:
# Default: ['<Super>Page_Down', '<Control><Alt>Down']
#          ['<Super>Page_Up', '<Control><Alt>Up']

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up']"

# Move current window between workspaces:
# Default: ['<Super><Shift>Page_Down', '<Control><Shift><Alt>Down']
#          ['<Super><Shift>Page_Up', '<Control><Shift><Alt>Up']

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift>Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift>Page_Up']"

# Unset weird keybiding that messes up multi monitor settings
# Default: ['<Super>p', 'XF86Display']

gsettings set org.gnome.mutter.keybindings switch-monitor "[]"

# Unset left/right workspace switching
# Default: ['<Control><Alt>Left']
#          ['<Control><Alt>Right']
#          ['<Control><Shift><Alt>Left']
#          ['<Control><Shift><Alt>Right']

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left []
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right []

# screenshot: ['<Shift>Print']
# screenshot-window: ['<Alt>Print']
gsettings set org.gnome.shell.keybindings screenshot "['<Shift><Super>p']"
gsettings set org.gnome.shell.keybindings screenshot-window "['<Super>p']"

# Nautilus settings
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gnome.nautilus.preferences show-delete-permanently true

