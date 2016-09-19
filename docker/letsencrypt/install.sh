# directories

mkdir -p /srv/docker/letsencrypt/{lib,logs,storage}

# add to cron

cp ./renew.sh /srv/docker/letsencrypt/renew.sh
job="4 51 1 * * /srv/docker/letsencrypt/renew.sh"
(crontab -u root -l; echo "$job") | crontab -u root -
