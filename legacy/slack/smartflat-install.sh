echo "Slack Token?"
read SLACK_TOKEN

docker run --name smartflat-slackin -e SLACK_ORG=smartfl-at -e SLACK_TOKEN="$SLACK_TOKEN" -p 55000:3000 -d chk1/slackin
sudo cp smartflat-nginx.conf /srv/docker/nginx/config/sites-enabled/smartflat-nginx.conf
