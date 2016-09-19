#!/bin/bash

# nginx

cp ./nginx.conf /srv/docker/nginx/config/sites-enabled/syncthing

# restart nginx

docker restart nginx
