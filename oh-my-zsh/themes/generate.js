const fs = require('fs')

// config
const systems = {
	pi: {
		color: 'magenta'
	},
	server: {
		color: 'yellow'
	},
	university: {
		color: 'green'
	},
	workstation: {
		color: 'cyan'
	}
}

// theme
const generateTheme = ({color, ...rest}) => ({
	...rest,
	color,
	theme: `# auto-generated zsh-theme

local ret_status="%(?::%{$fg_bold[red]%}x )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[red]%}⑆ %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

SSH="%{$fg[${color}]%}%{\${SSH_TTY:+[%n@%m] }%}%{$reset_color%}"
END="%(!.%{$fg[red]%}❯❯❯%{$reset_color%}.%{$fg[green]%}❯%{$reset_color%})"

PROMPT='\${SSH}\${ret_status}%{$reset_color%}%{$fg[${color}]%}%1~%{$reset_color%}%{$fg[red]%} %{$reset_color%}$(git_prompt_info)%{$reset_color%}\${END} '`
})

// destination
const generateDestination = ({name, ...rest}) => ({
	...rest,
	name,
	destination: `${__dirname}/${name}.zsh-theme`
})

// filesystem
const write = ({destination, theme}) => fs.writeFile(destination, theme)

// run it
Object
	.keys(systems)
	.map(name => ({name, ...systems[name]})
	.map(generateTheme)
	.map(generateDestination)
	.forEach(write)
