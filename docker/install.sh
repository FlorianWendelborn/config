# nginx

cp ./nginx.conf /srv/docker/nginx/config/sites-enabled/server

# reload nginx

docker exec -it nginx nginx -s reload
