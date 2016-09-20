# directories

mkdir -p /srv/docker/nginx/logs
mkdir -p /srv/docker/nginx/config/authentication
mkdir -p /srv/docker/nginx/root/.well-known
mkdir -p /srv/docker/nginx/config/sites-enabled

# copy

cp -r ./config /srv/docker/nginx/config/

# dhparam

openssl dhparam -rand - 2048 >> /srv/docker/nginx/config/dhparam.pem

# docker

docker pull nginx
