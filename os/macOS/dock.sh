#!/bin/sh

# add spacer
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# make it hide faster
defaults write com.apple.dock autohide-time-modifier -int 0
defaults write com.apple.dock autohide-delay -int 0

# lock it
defaults write com.apple.Dock position-immutable -bool TRUE
defaults write com.apple.Dock size-immutable -bool TRUE
defaults write com.apple.Dock contents-immutable -bool TRUE

# other
defaults write com.apple.Dock showhidden -bool TRUE
defaults write com.apple.dock mineffect -string suck

# restart
killall Dock
