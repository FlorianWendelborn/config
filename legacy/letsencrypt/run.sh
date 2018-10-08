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
			-d deploy.dodekeract.com \
			-d public.dodekeract.com \
			-d link.dodekeract.com \
			-d projects.dodekeract.com \
			-d server.dodekeract.com \
			-d ip.dodekeract.com \
			-d ip4.dodekeract.com \
			-d ip6.dodekeract.com \
			-d slack.dodekeract.com \
		certonly

# mail.dodekeract.com

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
		-d mail.dodekeract.com \
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
			-d slack.smartfl.at \
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

# reload nginx

docker exec -it nginx nginx -s reload
