#!/bin/bash -e

PICSDIR="$DOTFILES_DIR/pics/wallpaper"

PICF=$(find $PICSDIR -type f | shuf -n1)

feh --bg-scale $PICF

