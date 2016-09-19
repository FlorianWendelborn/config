# start

docker run --name nginx \
	-d \
	-p 80:80 \
	-p 443:443 \
	-v /srv/docker/nginx/config:/etc/nginx:ro \
	-v /srv/docker/nginx/logs:/var/log/nginx \
	-v /srv/docker/nginx/root:/usr/share/nginx/html:ro \
	-v /srv/docker/letsencrypt/storage/live:/etc/letsencrypt/live:ro \
	nginx
