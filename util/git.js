const child = require('child_process')
const inquirer = require('inquirer')
const os = require('os')

const run = async () => {
	// gather information
	const { repositoryName, shortName, userName } = await inquirer.prompt([
		{
			type: 'input',
			name: 'userName',
			message: 'GitHub User Name?',
			default: 'dodekeract',
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
		`git clone git@github.com:${userName}/${repositoryName} ${outputDirectory}`
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
