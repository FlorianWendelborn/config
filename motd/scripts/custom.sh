#!/bin/sh

# config

SERVER_NAME="server.DODEKERACT.com"

# calculate

IP="$(hostname -I | sed -e 's/\ /\ \ \ \ /g')"
FIGLET="$(figlet -w 92 -f small $SERVER_NAME)"
DISTRIBUTION="$(lsb_release -s -d) $(uname -r) $(uname -m)"
DOCKER="$(docker ps -a --format 'table {{.Status}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}' | sed -e 's/tcp\,.*$/tcp.../' | sed -e 's/0\.0\.0\.\0\://')"
UPTIME="$(uptime | cut -f4,5,6 -d' ' | cut -f1,2 -d',') hours"
TIME="$(date +'%T')"

# print

printf "\033[32m$FIGLET\033[0m\n"
printf "          IP: $IP\n"
printf "Distribution: $DISTRIBUTION\n"
printf "      Uptime: $UPTIME\n"
printf "        Time: $TIME\n"

printf "\n"
printf "$DOCKER"
