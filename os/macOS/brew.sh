#!/bin/sh

# prepare
brew tap caskroom/cask

# install

## browsers
brew cask install firefoxdeveloperedition google-chrome-canary opera safari-technology-preview

## design
brew cask install colorsnapper

## developer
brew cask install atom iterm2 paw tower

## media
brew cask install iina qsyncthingtray webtorrent

## [quicklook](https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo

## other
brew install ctop
brew cask install disk-inventory-x
brew cask install teamspeak-client
brew cask install teamviewer
brew cask install virtualbox
