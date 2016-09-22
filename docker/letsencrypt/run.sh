# run letsencrypt

# dodekeract.com

docker run \
	--rm \
	--name letsencrypt \
	-v "/srv/docker/letsencrypt/logs:/var/log/letsencrypt" \
	-v "/srv/docker/letsencrypt/storage:/etc/letsencrypt" \
	-v "/srv/docker/letsencrypt/lib:/var/lib/letsencrypt" \
	-v "/srv/docker/nginx/root:/usr/share/webroot" \
	dodekeract/letsencrypt \
		--webroot-path "/usr/share/webroot" \
		-c "/config.ini" \
		-d dodekeract.com \
			-d public.dodekeract.com \
			-d link.dodekeract.com \
			-d projects.dodekeract.com \
			-d server.dodekeract.com \
		certonly

# smartfl.at

docker run \
	--rm \
	--name letsencrypt \
	-v "/srv/docker/letsencrypt/logs:/var/log/letsencrypt" \
	-v "/srv/docker/letsencrypt/storage:/etc/letsencrypt" \
	-v "/srv/docker/letsencrypt/lib:/var/lib/letsencrypt" \
	-v "/srv/docker/nginx/root:/usr/share/webroot" \
	dodekeract/letsencrypt \
		--webroot-path "/usr/share/webroot" \
		-c "/config.ini" \
		-d smartfl.at \
			-d dns.smartfl.at \
			-d festival.smartfl.at \
		certonly

# impequid.com

docker run \
	--rm \
	--name letsencrypt \
	-v "/srv/docker/letsencrypt/logs:/var/log/letsencrypt" \
	-v "/srv/docker/letsencrypt/storage:/etc/letsencrypt" \
	-v "/srv/docker/letsencrypt/lib:/var/lib/letsencrypt" \
	-v "/srv/docker/nginx/root:/usr/share/webroot" \
	dodekeract/letsencrypt \
		--webroot-path "/usr/share/webroot" \
		-c "/config.ini" \
		-d impequid.com \
			-d services.impequid.com \
		certonly

# iotfl.at

docker run \
	--rm \
	--name letsencrypt \
	-v "/srv/docker/letsencrypt/logs:/var/log/letsencrypt" \
	-v "/srv/docker/letsencrypt/storage:/etc/letsencrypt" \
	-v "/srv/docker/letsencrypt/lib:/var/lib/letsencrypt" \
	-v "/srv/docker/nginx/root:/usr/share/webroot" \
	dodekeract/letsencrypt \
		--webroot-path "/usr/share/webroot" \
		-c "/config.ini" \
		-d iotfl.at \
		certonly

# dodekeract.report

docker run \
	--rm \
	--name letsencrypt \
	-v "/srv/docker/letsencrypt/logs:/var/log/letsencrypt" \
	-v "/srv/docker/letsencrypt/storage:/etc/letsencrypt" \
	-v "/srv/docker/letsencrypt/lib:/var/lib/letsencrypt" \
	-v "/srv/docker/nginx/root:/usr/share/webroot" \
	dodekeract/letsencrypt \
		--webroot-path "/usr/share/webroot" \
		-c "/config.ini" \
		-d dodekeract.report \
			-d manta.dodekeract.report \
			-d server.dodekeract.report \
			-d static.dodekeract.report \
			-d tbz.dodekeract.report \
		certonly

# reportmy.team

docker run \
	--rm \
	--name letsencrypt \
	-v "/srv/docker/letsencrypt/logs:/var/log/letsencrypt" \
	-v "/srv/docker/letsencrypt/storage:/etc/letsencrypt" \
	-v "/srv/docker/letsencrypt/lib:/var/lib/letsencrypt" \
	-v "/srv/docker/nginx/root:/usr/share/webroot" \
	dodekeract/letsencrypt \
		--webroot-path "/usr/share/webroot" \
		-c "/config.ini" \
		-d reportmy.team \
			-d gg.reportmy.team \
			-d please.reportmy.team \
		certonly

# hacker.digital

docker run \
	--rm \
	--name letsencrypt \
	-v "/srv/docker/letsencrypt/logs:/var/log/letsencrypt" \
	-v "/srv/docker/letsencrypt/storage:/etc/letsencrypt" \
	-v "/srv/docker/letsencrypt/lib:/var/lib/letsencrypt" \
	-v "/srv/docker/nginx/root:/usr/share/webroot" \
	dodekeract/letsencrypt \
		--webroot-path "/usr/share/webroot" \
		-c "/config.ini" \
		-d hacker.digital \
			-d dustincompetent.hacker.digital \
			-d dinc.hacker.digital \
		certonly

# reload nginx

docker exec -it nginx nginx -s reload
