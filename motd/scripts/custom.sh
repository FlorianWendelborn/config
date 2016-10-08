#!/bin/zsh

# config

SERVER_NAME="server.DODEKERACT.com"

# calculate

IP="$(hostname -I | sed -e 's/\ /\ \ \ \ /g')"
FIGLET="$(figlet -w 92 -f small $SERVER_NAME)"
DISTRIBUTION="$(lsb_release -s -d) $(uname -r) $(uname -m)"
DOCKER=$(echo "STATUS\tNAME\tIMAGE\tPORTS\n$(docker ps -a --format '{{.Status}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}')" | sed -e 's/\/tcp/t/g' | sed -e 's/\/udp/u/g' | sed -e 's/\,\ /\ /g' | sed -e 's/[-][>]/-/g' | sed -e 's/0\.0\.0\.\0\://g' | sed -e 's/\b\([0-9]\+\)[-,\n]\1/\1/g' | column -t -s $'\t')
UPTIME=$(echo "$(uptime | cut -f4,5,6 -d' ' | cut -f1,2 -d',') hours" | sed -e 's/\,\ \ hours//g')
TIME="$(date +'%T')"

# print

printf "\033[2J\033[;H"
printf "\033[32m$FIGLET\033[0m\n"
printf "          IP: $IP\n"
printf "Distribution: $DISTRIBUTION\n"
printf "      Uptime: $UPTIME\n"
printf "        Time: $TIME\n"

printf "\n"
printf "$DOCKER"
