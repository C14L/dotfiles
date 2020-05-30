#!/bin/bash

echo "Download and install Google Chrome..."
echo

CHROME_URL="https://dl.google.com/linux/direct"
CHROME_FILE="google-chrome-stable_current_amd64.deb"

wget --show-progress --directory-prefix="$HOME/Downloads" $CHROME_URL/$CHROME_FILE

sudo dpkg -i $HOME/Downloads/$CHROME_FILE

