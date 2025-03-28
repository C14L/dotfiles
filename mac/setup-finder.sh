#!/usr/bin/env zsh

# Some useful settings for MacOS Finder.

# Show hidden files in Finder. GUI: `Cmd + Shift + .`
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Restart Finder to apply changes
killall Finder
