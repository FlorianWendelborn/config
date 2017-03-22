// region import
const fs = require('fs')
// endregion

// region config
const aliases = {
	// directories
	c: 'cd ~/code',
	ca: 'cd ~/code/attach',

	// docker
	dps: 'docker ps -a',

	// tmux
	t: 'tmux a -t 0',
	ta: 'tmuxinator start attach',

	// yarn
	yw: 'yarn run watch',

	// other
	ip4: 'curl https://ip4.dodekeract.com',
	sz: 'source ~/.zshrc'
}
const environment = {
	// language
	LANG: 'en_US.UTF-8',
	LC_ALL: 'en_US.UTF-8',

	// oh-my-zsh
	HYPHEN_INSENSITIVE: 'true',
	ZSH: '/opt/oh-my-zsh',
	ZSH_CUSTOM: '/opt/oh-my-zsh/custom',

	// other
	EDITOR: 'vi',
	PATH: 'usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games'
}
const systems = {
	castleOfGods: {
		color: 'cyan',
		shortName: 'g',
		ssh: {
			host: 'dodekeract.smartfl.at',
			port: 23,
			user: 'dodekeract'
		}
	},
	crusade: {
		color: 'yellow',
		shortName: 'c',
		ssh: {
			host: 'server.dodekeract.com',
			port: 22,
			user: 'dodekeract'
		}
	},
	spider: {
		color: 'magenta',
		shortName: 's',
		ssh: {
			host: 'dodekeract.smartfl.at',
			port: 22,
			user: 'pi'
		}
	},
	university: {
		color: 'green',
		shortName: 'u',
		ssh: {
			host: 'gruenau.informatik.hu-berlin.de',
			port: 22,
			user: 'fwendelborn'
		}
	}
}
// endregion

// region theme
const theme = ({color}) => `# auto-generated .zsh-theme

local ret_status="%(?::%{$fg_bold[red]%}x )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[red]%}⑆ %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

SSH="%{$fg[${color}]%}%{\${SSH_TTY:+[%n@%m] }%}%{$reset_color%}"
END="%(!.%{$fg[red]%}❯❯❯%{$reset_color%}.%{$fg[green]%}❯%{$reset_color%})"

PROMPT='\${SSH}\${ret_status}%{$reset_color%}%{$fg[${color}]%}%1~%{$reset_color%}%{$fg[red]%} %{$reset_color%}$(git_prompt_info)%{$reset_color%}\${END} '`
// endregion

// region ssh
const ssh = name => Object
	.keys(systems)
	.filter(id => id !== name)
	.map(name => {
		const {shortName, ssh: {host, port, user}} = systems[name]
		return `alias s${shortName}="ssh -p ${port} ${user}@${host}"`
	})
	.join('\n')
// endregion

// region zshrc
const rc = ({name, shortName}) => `# auto-generated .zshrc

#environment
${Object.keys(environment).sort().map(name => `export ${name}="${environment[name]}"`).join('\n')}

#alias
${Object.keys(aliases).sort().map(name => `alias ${name}="${aliases[name]}"`).join('\n')}

# machine
export MACHINE_NAME="${name}"
export ZSH_THEME="${name}"

# ssh
${ssh(name)}

# oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(git)`
// endregion

// region generate it!
Object
	.keys(systems)
	.forEach(name => {
		fs.writeFileSync(`${__dirname}/themes/${name}.zsh-theme`, theme(systems[name]))
		fs.writeFileSync(`${__dirname}/rc/${name}.zshrc`, rc(
			Object.assign({name}, systems[name])
		))
	})
// endregion
