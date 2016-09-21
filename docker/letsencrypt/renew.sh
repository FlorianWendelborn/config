docker run \
	--rm \
	--name letsencrypt \
	-v "/srv/docker/letsencrypt/logs:/var/log/letsencrypt" \
	-v "/srv/docker/letsencrypt/storage:/etc/letsencrypt" \
	-v "/srv/docker/letsencrypt/lib:/var/lib/letsencrypt" \
	-v "/srv/docker/nginx/root:/usr/share/webroot" \
	letsencrypt:latest \
		--webroot-path "/usr/share/webroot" \
		-c "/config.ini" \
		renew

# reload nginx

docker exec -it nginx nginx -s reload
