#!/bin/bash

TARGET="/srv/docker/nginx/root/projects"
SITES="/srv/docker/nginx/config/sites-enabled"

# create folder

mkdir -p $TARGET

# clone

function clone () {
	(git clone https://github.com/dodekeract/$1 &> /dev/null) || (pushd $1 && git pull && popd)
}

# go

pushd $TARGET

	clone mandelbrot
	clone particles
	clone line-replace-fractals
	clone spirograph
	clone spot-the-difference

	# manta

	clone manta-config-engine-app
	pushd manta-config-engine-app
		npm install
		npm run build
		mv build ../manta
	popd

popd

# copy nginx config

cp ./nginx.conf $SITES/projects.dodekeract.com
cp ./legacy.conf $SITES/projects-legacy

# reload nginx

docker exec -it nginx nginx -s reload
