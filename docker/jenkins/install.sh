# configuration

STORAGE="/srv/docker/jenkins"

# download

docker pull jenkins

# storage

mkdir -p "$STORAGE/storage"

# create

docker create \
	--name jenkins \
	-p 55000:8080 \
	-v "$STORAGE/storage:/var/jenkins_home" \
	jenkins
