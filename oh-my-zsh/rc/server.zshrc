export MACHINE_TYPE="server"

export ZSH=/opt/oh-my-zsh
ZSH_THEME="server"
HYPHEN_INSENSITIVE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
plugins=(git)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

# language

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# settings

export EDITOR="vi"

# ip

alias ip4="curl https://ip4.dodekeract.com"

# tmux

alias t="tmux a -t 0"

# cd

alias c="cd ~/code"

# npm

alias nw="npm run watch"

# ssh

alias ss="echo 'already on server'"
alias sw="ssh -p 23 dodekeract@home.dodekeract.com"
alias sp="ssh pi@home.dodekeract.com"

# docker

alias dpsa="docker ps -a"
alias dps="docker ps"

# source

alias sz="source ~/.zshrc"
