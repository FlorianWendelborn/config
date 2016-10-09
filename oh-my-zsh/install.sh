#!/bin/bash

if [ -z ${MACHINE_TYPE+x} ]; then
	echo "NO MACHINE_TYPE SET"
	exit 1
fi

if [ -z ${ZSH_CUSTOM+x} ]; then
	echo "NO ZSH_CUSTOM SET"
	exit 1
fi

# zshrc

cp "rc/$MACHINE_TYPE.zshrc" ~/.zshrc
chown dodekeract:dodekeract ~/.zshrc || chown dodekeract:staff ~/.zshrc

# theme

cp -r themes $ZSH_CUSTOM/
chown -R root:root $ZSH_CUSTOM/ || chown -R root:staff $ZSH_CUSTOM/
