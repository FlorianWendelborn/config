#!/bin/bash

# docker

docker run \
	-d \
	--name=syncthing \
	-v /srv/docker/syncthing/config:/config \
	-v /srv/docker/syncthing/data:/data \
	-e PGID=$GID -e PUID=$UID \
	-p 8384:8384 -p 22000:22000 -p 21027:21027/udp \
	linuxserver/syncthing
