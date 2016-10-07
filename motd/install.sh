#!/bin/bash

MOTD="/etc/update-motd.d"
MOTD_OLD="/etc/update-motd.d.old"

# move old motd

if [ ! -d "$MOTD_OLD" ]; then
	mv "$MOTD" "$MOTD_OLD"
fi

# copy new motd

rm -r "$MOTD"
cp -r ./scripts "$MOTD"
mv "$MOTD/custom.sh" "$MOTD/00-custom"
