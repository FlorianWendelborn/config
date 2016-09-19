# directories

mkdir -p /srv/docker/nginx/{logs,root,config}
mkdir -p /srv/docker/nginx/root/.well-known

# dhparam

openssl dhparam -rand - 2048 >> /srv/docker/nginx/config/dhparam.pem

# docker

docker pull nginx
