const child = require('child_process')
const inquirer = require('inquirer')
const os = require('os')

const run = async () => {
	// gather information
	const { name } = await inquirer.prompt([
		{
			type: 'input',
			name: 'name',
			message: 'Project name?',
		},
	])

	const outputDirectory = `${os.homedir()}/Code/Temporary/${name}`
	const atomProjectsDirectory = `${os.homedir()}/.atom/projects`

	// link
	const linkLocation = `${atomProjectsDirectory}/Temporary:${name}`
	child.execSync(`rm -f ${linkLocation}`)
	child.execSync(`ln -s ${outputDirectory} ${linkLocation}`)

	// install
	child.execSync(
		`mkdir -p ${outputDirectory}; cd ${outputDirectory}; touch index.js`
	)
}

run()
