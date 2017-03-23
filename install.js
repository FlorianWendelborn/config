// region import
const child = require('child_process')
const fs = require('fs')
const inquirer = require('inquirer')
const os = require('os')

// internal
const _ = require('./devices/_')
const generateMotd = require('./generate/motd')
const generateRc = require('./generate/rc')
const generateTheme = require('./generate/theme')
// endregion

// region ssh
const deviceList = fs
	.readdirSync(`${__dirname}/devices`)
	.filter(file => file !== '_.json')
	.map(file => file.split('.')[0])
// endregion

// region dialog
;(async () => {
	// #region gather information
	const {name} = await inquirer.prompt([{
		type: 'list',
		name: 'name',
		message: 'Which system is this?',
		choices: deviceList
	}])
	const info = require(`${__dirname}/devices/${name}`)
	// #endregion

	// #region generate
	if (info.hasMotd) {
		const dir = '/etc/update-motd.d/00-custom'
		fs.writeFileSync(dir, generateMotd(info))
		child
			.execSync(`chown ${info.root.user}:${info.root.group} ${dir}`)
			.toString().trim()
	}

	fs.writeFileSync(`${os.homedir()}/.zshrc`, generateRc(name))
	fs.writeFileSync('/opt/oh-my-zsh/custom/themes/dodekeract.zsh-theme', generateTheme(info))

	child.execSync(`chown ${info.user}:${info.group} ${os.homedir()}/.zshrc`)
	child.execSync(`chown ${info.root.user}:${info.root.group} /opt/oh-my-zsh/custom/themes/dodekeract.zsh-theme`)
	// #endregion

	// #region create folders
	_.folders.forEach(folder => child.execSync(`mkdir -p ${folder.replace('~', os.homedir())}`))
	// #endregion
})()
// endregion
