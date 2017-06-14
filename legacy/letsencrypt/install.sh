#!/bin/bash

# directories

mkdir -p /srv/docker/letsencrypt/{lib,logs,storage}

# build docker

docker build -t dodekeract/letsencrypt .

# add to cron

cp ./renew.sh /srv/docker/letsencrypt/renew.sh
job="51 4 1 * * /srv/docker/letsencrypt/renew.sh"
(crontab -u root -l; echo "$job") | crontab -u root -
