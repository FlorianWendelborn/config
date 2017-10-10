const child = require('child_process')
const inquirer = require('inquirer')
const os = require('os')

const run = async () => {
	// gather information
	const { userName, repositoryName } = await inquirer.prompt([
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
	])

	const outputDirectory = `${os.homedir()}/Code/@${userName}/${repositoryName}`
	const atomProjectsDirectory = `${os.homedir()}/.atom/projects`

	// clone
	child.execSync(
		`git clone git@github.com:${userName}/${repositoryName} ${outputDirectory}`
	)

	// link
	child.execSync(
		`ln -s ${outputDirectory} ${atomProjectsDirectory}/@${userName}:${repositoryName}`
	)

	// tower
	child.execSync(`gittower ${outputDirectory}`)
}

run()
