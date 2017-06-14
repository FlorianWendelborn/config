#!/bin/bash

# folders

mkdir -p /srv/docker/syncthing/config
mkdir -p /srv/docker/syncthing/data

# docker

docker pull linuxserver/syncthing
