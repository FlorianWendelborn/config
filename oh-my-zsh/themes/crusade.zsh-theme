# auto-generated .zsh-theme

local ret_status="%(?::%{$fg_bold[red]%}x )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[red]%}⑆ %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

SSH="%{$fg[yellow]%}%{${SSH_TTY:+[%n@%m] }%}%{$reset_color%}"
END="%(!.%{$fg[red]%}❯❯❯%{$reset_color%}.%{$fg[green]%}❯%{$reset_color%})"

PROMPT='${SSH}${ret_status}%{$reset_color%}%{$fg[yellow]%}%1~%{$reset_color%}%{$fg[red]%} %{$reset_color%}$(git_prompt_info)%{$reset_color%}${END} '