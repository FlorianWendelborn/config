// region generate it!
module.exports = device => `#!/bin/zsh

# calculate
IP="$(hostname -I | sed -e 's/\\ /\\ \\ \\ \\ /g')"
FIGLET="$(figlet -w 92 -f small ${device.hostname})"
DISTRIBUTION="${device.commands.distribution}"
${device.hasDocker ? `DOCKER=$(echo "STATUS\\tNAME\\tIMAGE\\tPORTS\\n$(docker ps -a --format '{{.Status}}\\t{{.Names}}\\t{{.Image}}\\t{{.Ports}}')" | sed -e 's/\\/tcp/t/g' -e 's/\\/udp/u/g' -e 's/\\,\\ /\\ /g' -e 's/[-][>]/-/g' -e 's/0\\.0\\.0\\.\\0\\://g' -e 's/\\b\\([0-9]\\+\\)[-,\\n]\\1/\\1/g' | column -t -s $'\\t')` : '# no docker'}
UPTIME=$(echo "$(uptime | cut -f4,5,6 -d' ' | cut -f1,2 -d',') hours" | sed -e 's/\\,\\ \\ hours//g')
TIME="$(date +'%T')"

# print
printf "\\033[2J\\033[;H"
printf "\\033[32m$FIGLET\\033[0m\\n"
printf "          IP: $IP\\n"
printf "Distribution: $DISTRIBUTION\\n"
printf "      Uptime: $UPTIME\\n"
printf "        Time: $TIME\\n"
printf "\\n"
${device.hasDocker ? `printf "$DOCKER"` : '# no docker'}
`
// endregion
