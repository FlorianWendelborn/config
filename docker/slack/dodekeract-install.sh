echo "Slack Token?"
read SLACK_TOKEN

docker run --name dodekeract-slackin -e SLACK_ORG=dodekeract -e SLACK_TOKEN="$SLACK_TOKEN" -p 55001:3000 -d chk1/slackin
sudo cp dodekeract-nginx.conf /srv/docker/nginx/config/sites-enabled/dodekeract-nginx.conf
