#!/bin/bash

# folders

mkdir -p /srv/docker/syncthing/config
mkdir -p /srv/docker/syncthing/data

# docker

docker pull linuxserver/syncthing

# nginx

cp ./nginx.conf /srv/docker/nginx/config/sites-enabled/syncthing

docker restart nginx
