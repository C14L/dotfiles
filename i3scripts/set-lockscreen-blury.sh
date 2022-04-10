#!/bin/sh -e

# Just in case there is an old version still there
rm -f /tmp/i3wm_screen_locked.png

# Take a screenshot
scrot /tmp/i3wm_screen_locked.png

# Pixellate it 10x
#mogrify -scale 10% -scale 1000% /tmp/i3wm_screen_locked.png

mv /tmp/i3wm_screen_locked.png /tmp/i3wm_screen_locked_raw.png
convert /tmp/i3wm_screen_locked_raw.png -scale 10% -scale 1000% /tmp/i3wm_screen_locked.png
rm -f /tmp/i3wm_screen_locked_raw.png

# Blurr instead
#mogrify -blur 0x6 /tmp/i3wm_screen_locked.png

#mv /tmp/i3wm_screen_locked.png /tmp/i3wm_screen_locked_raw.png
#convert /tmp/i3wm_screen_locked_raw.png -blur 0x6 /tmp/i3wm_screen_locked.png
#rm -f /tmp/i3wm_screen_locked_raw.png

# https://faq.i3wm.org/question/83/how-to-run-i3lock-after-computer-inactivity.1.html
# Lock screen displaying this image.
i3lock -i /tmp/i3wm_screen_locked.png -t -c 222222 -e -f

# Turn the screen off after a delay.
#sleep 180; pgrep i3lock && xset dpms force off

