#!/bin/bash

TARGET="/srv/docker/nginx/root/projects"
SITES="/srv/docker/nginx/config/sites-enabled"

# create folder

mkdir -p $TARGET

# clone

pushd $TARGET

	git clone https://github.com/dodekeract/mandelbrot
	git clone https://github.com/dodekeract/particles
	git clone https://github.com/dodekeract/line-replace-fractals
	git clone https://github.com/dodekeract/spirograph
	git clone https://github.com/dodekeract/spot-the-difference

	# manta

	git clone https://github.com/dodekeract/manta-config-engine-app
	pushd manta-config-engine-app
		npm install
		npm run build
		mv build ../manta
	popd
	rm -rf manta-config-engine-app

popd

# copy nginx config

cp ./nginx.conf $SITES/projects.dodekeract.com
cp ./nginx.conf $SITES/projects-legacy

# restart nginx

docker restart nginx
