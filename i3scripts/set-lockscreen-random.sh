#!/bin/sh -e

DIR="$HOME/.myconf/pics/lockscreen"
PIC=$(find $DIR -type f | shuf -n1)

i3lock -p win -i "$PIC" -t -c 222222 -e -f

# Turn the screen off after a delay.
#sleep 180; pgrep i3lock && xset dpms force off

