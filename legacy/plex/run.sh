docker run \
	-d \
	--name=plex \
	-p 32400:32400 \
	-e VERSION=latest \
	-e PUID=$UID \
	-e PGID=$GID \
	-e TZ=Europe/Berlin \
	-v /srv/docker/plex/config:/config \
	-v /srv/docker/plex/data:/data \
	-v /srv/docker/plex/transcode:/transcode \
	linuxserver/plex
