# start

docker run --name nginx \
	-d \
	-p 80:80 \
	-p 443:443 \
	--net=host \
	-v /srv/docker/nginx/config:/etc/nginx:ro \
	-v /srv/docker/nginx/logs:/var/log/nginx \
	-v /srv/docker/nginx/root:/usr/share/nginx/html:ro \
	-v /srv/docker/letsencrypt/storage:/etc/letsencrypt:ro \
	nginx
