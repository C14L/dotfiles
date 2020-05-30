#!/bin/bash

echo "Linking git-aware-prompt into ~/bin directory"

mkdir -p $HOME/bin 2>/dev/null
rm -f $HOME/bin/git-aware-prompt
ln -s --backup=numbered $DOTFILES_DIR/thirdparty/git-aware-prompt $HOME/bin/

