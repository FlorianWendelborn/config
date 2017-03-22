# auto-generated .zshrc

#environment
export EDITOR="vi"
export HYPHEN_INSENSITIVE="true"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH="usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export ZSH="/opt/oh-my-zsh"
export ZSH_CUSTOM="/opt/oh-my-zsh/custom"

#alias
alias c="cd ~/code"
alias ca="cd ~/code/attach"
alias dps="docker ps -a"
alias ip4="curl https://ip4.dodekeract.com"
alias sz="source ~/.zshrc"
alias t="tmux a -t 0"
alias ta="tmuxinator start attach"
alias yw="yarn run watch"

# machine
export MACHINE_NAME="spider"
export ZSH_THEME="spider"

# ssh
alias sg="ssh -p 23 dodekeract@dodekeract.smartfl.at"
alias sc="ssh -p 22 dodekeract@server.dodekeract.com"
alias su="ssh -p 22 fwendelborn@gruenau.informatik.hu-berlin.de"

# oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(git)