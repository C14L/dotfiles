#!/usr/bin/env bash

find $DOTFILES_DIR/scripts/ -name "display-setup-*.sh" -type f | \
    sort | dmenu -i -l 25 -p '' | bash

