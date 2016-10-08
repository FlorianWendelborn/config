#!/bin/bash

OH_MY_ZSH="/opt/oh-my-zsh"

# zshrc

cp .zshrc ~/.zshrc
chown dodekeract:dodekeract .zshrc

# theme

cp dodekeract.zsh-theme "$OH_MY_ZSH/themes/dodekeract.zsh-theme"

chown root:root "$OH_MY_ZSH/themes/dodekeract.zsh-theme"
