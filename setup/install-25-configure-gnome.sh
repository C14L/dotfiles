#!/usr/bin/env bash

######################################################################
# Change Gnome default key mappings
######################################################################
#
# List all bindings:
#
#   gsettings list-recursively  org.gnome.desktop.wm.keybindings | sort
#
# Number pad keys:
#
#   Numpad 0 - Kp_INS
#   Numpad 1 - Kp_END
#   Numpad 2 - Kp_DOWNARROW
#   Numpad 3 - Kp_Page_Up
#   Numpad 4 - Kp_Left
#   Numpad 5 - Kp_5
#   Numpad 6 - Kp_RIGHTARROW
#   Numpad 7 - Kp_HOME
#   Numpad 8 - Kp_UPARROW
#   Numpad 9 - Kp_PGUP
#   Numpad Dot or . - Kp_DEL
#   Numpad ENTER - Kp_ENTER
#   Numpad + - Kp_PLUS
#   Numpad - - Kp_MINUS
#   Numpad * - Kp_MULTIPLY
#   Numpad / - Kp_SLASH
#   Numpad next to Slash - Kp_NUMLOCK
#
######################################################################

# disable window grouping and enable window switching

gsettings set org.gnome.desktop.wm.keybindings switch-applications          "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows               "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward      "['<Shift><Super>Tab']"

# Disable Ctrl+Shift+Arrow Keys to switch desktop down/up, use <Super> instead:
# Default: ['<Super>Page_Down', '<Control><Alt>Down']
#          ['<Super>Page_Up', '<Control><Alt>Up']

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up   "[]"

# Move current window between workspaces:
# Default: ['<Super><Shift>Page_Down', '<Control><Shift><Alt>Down']
#          ['<Super><Shift>Page_Up', '<Control><Shift><Alt>Up']

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up   "[]"

# Unset weird keybiding that messes up multi monitor settings
# Default: ['<Super>p', 'XF86Display']

gsettings set org.gnome.mutter.keybindings switch-monitor "[]"

# Unset left/right workspace switching
# Default: ['<Control><Alt>Left']
#          ['<Control><Alt>Right']
#          ['<Control><Shift><Alt>Left']
#          ['<Control><Shift><Alt>Right']

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left  "['<Super>Page_Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left    "['<Super><Shift>Page_Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right   "['<Super><Shift>Page_Down']"

# screenshot: ['<Shift>Print']
# screenshot-window: ['<Alt>Print']
#gsettings set org.gnome.shell.keybindings screenshot "['<Shift><Super>p']"
#gsettings set org.gnome.shell.keybindings screenshot-window "['<Super>p']"

# Nautilus settings
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gnome.nautilus.preferences show-delete-permanently true

# Place window in a screen corner or the screen center
gsettings set org.gnome.desktop.wm.keybindings move-to-center    "['<Super>Kp_5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-nw "['<Super>Kp_Home']"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-ne "['<Super>Kp_Page_Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-se "['<Super>Kp_Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-sw "['<Super>Kp_End']"
