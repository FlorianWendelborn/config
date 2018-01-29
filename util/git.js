const child = require('child_process')
const inquirer = require('inquirer')
const os = require('os')

const DEFAULT_USERNAMES = {
	'github.com': 'dodekeract',
	'bitbucket.org': '3yourmind',
}

const run = async () => {
	// gather information
	const { host } = await inquirer.prompt([
		{
			type: 'list',
			name: 'host',
			message: 'Host?',
			choices: ['github.com', 'bitbucket.org'],
		},
	])

	const { repositoryName, shortName, userName } = await inquirer.prompt([
		{
			type: 'input',
			name: 'userName',
			message: 'User Name?',
			default: DEFAULT_USERNAMES[host],
		},
		{
			type: 'input',
			name: 'repositoryName',
			message: 'Repository Name?',
			default: '',
		},
		{
			type: 'input',
			name: 'shortName',
			message: 'Short name?',
			default: '',
		},
	])

	const name = shortName || repositoryName

	const outputDirectory = `${os.homedir()}/Code/@${userName}/${name}`
	const atomProjectsDirectory = `${os.homedir()}/.atom/projects`

	// clone
	child.execSync(
		`git clone git@${host}:${userName}/${repositoryName} ${outputDirectory}`
	)

	// link
	const linkLocation = `${atomProjectsDirectory}/@${userName}:${name}`
	child.execSync(`rm -f ${linkLocation}`)
	child.execSync(`ln -s ${outputDirectory} ${linkLocation}`)

	// install
	child.execSync(`cd ${outputDirectory}; yarn install`)

	// tower
	child.execSync(`gittower ${outputDirectory}`)
}

run()
