// region import
const fs = require('fs')
const _ = require('../devices/_')
// endregion

// region ssh
const ssh = (name) => fs
	.readdirSync(`${__dirname}/../devices`)
	.filter(file =>
		file !== name
		&& file !== `${name}.json`
		&& file !== '_.json'
	)
	.map(file => require(`${__dirname}/../devices/${file}`))
	.filter(({ssh}) => Boolean(ssh))
	.map(({shortName, ssh: {host, port, user}}) =>
		`alias s${shortName}="ssh -4 -p ${port} ${user}@${host}"`
	)
	.join('\n')
// endregion

// region generate it!
module.exports = name => `# auto-generated .zshrc

#environment
${Object.keys(_.environment).sort().map(name => `export ${name}="${_.environment[name]}"`).join('\n')}

#alias
${Object.keys(_.aliases).sort().map(name => `alias ${name}="${_.aliases[name]}"`).join('\n')}

# machine
export MACHINE_NAME="${name}"
export ZSH_THEME="dodekeract"

# ssh
${ssh(name)}

# oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(git)
`
// endregion
