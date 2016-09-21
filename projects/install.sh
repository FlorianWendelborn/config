#!/bin/bash

$TARGET="/srv/docker/nginx/root/projects"
$SITES="/srv/docker/nginx/config/sites-enabled"

# create folder

mkdir -p $TARGET
cd $TARGET

# clone

git clone https://github.com/dodekeract/mandelbrot
git clone https://github.com/dodekeract/particles
git clone https://github.com/dodekeract/line-replace-fractals
git clone https://github.com/dodekeract/spirograph
git clone https://github.com/dodekeract/spot-the-difference

# copy nginx config

cp ./nginx.conf $SITES/projects.dodekeract.com

# restart nginx

docker restart nginx
