# defaults write com.apple.screencapture location /Volumes/Warehouse/Sync/Inbox
defaults write com.apple.finder AppleShowAllFiles -bool TRUE

killall Finder

defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true
