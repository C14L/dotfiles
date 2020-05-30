#!/usr/bin/env bash

cat $HISTFILE | \
    grep -vP '#\d+$' | \
    grep -vP '(\[A|ll?l?|htop|kk|cd|cd \.\.)$' | \
    grep -vP 'git (status|pull \-\-rebase|add \.)$' | \
    grep -vP '(tig|exit?|date|python3?)$' | \
    sort | uniq | dmenu -i -l 25 -p '' | \
    cut -d']' -f2 | sed 's/^ //' | tr -d '\n' | \
    xclip -selection clipboard

