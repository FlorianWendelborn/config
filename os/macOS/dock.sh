#!/bin/sh

# add spacer
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

defaults write com.apple.dock autohide-time-modifier -int 0
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.Dock showhidden -bool TRUE

killall Dock
