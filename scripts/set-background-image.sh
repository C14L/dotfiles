#!/bin/bash -e

SCRIPTDIR=$( cd "$( dirname "$0" )"; pwd )

#PICSDIR="$DOTFILES_DIR/pics/wallpaper"
PICSDIR="$SCRIPTDIR/../pics/wallpaper"

PICF=$(find $PICSDIR -type f | shuf -n1)

feh --bg-scale $PICF

