#!/bin/bash

[ -z "$DOTFILES_DIR" ] && echo "Error: DOTFILES_DIR envvar not set." && exit 1

CONFS="$DOTFILES_DIR/confs"

for f in $(ls -1A $CONFS/); do

    t=$(echo -n $f | sed 's/__/\//g') && mkdir -p "$(dirname $HOME/$t)" \
      && ln -s --backup=numbered $CONFS/$f $HOME/$t && echo $HOME/$t

done

